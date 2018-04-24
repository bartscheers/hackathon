import logging, time, os, sys
import numpy as np
import healpy as hp
import pylab

from pymonetdb.sql.connections import Connection as connect
from pymonetdb.exceptions import Error as DBError
from pymonetdb.exceptions import OperationalError as OError

def get_skycovfig(conn, nside, fsvg):
    """Return the sky coverage of all runcat sources

    """

    with open('sql/skycov.sql', 'r') as f:
        qu = f.read()
    params = {'nside': nside}
    query = qu % (params)

    try:
        cursor = conn.cursor()
        t0 = time.time()
        cursor.execute(query)
        t = round(1000 * (time.time() - t0), 3)
        results = zip(*cursor.fetchall())
        cursor.close()
        print "# Q : (Q01: %s ms) Sky coverage figure" % (t)
        print "# Query:\n%s" % (query)
    except DBError, dbe:
        print "Failed for reason %s on query %s" % (dbe, query)
        raise

    if len(results) != 0:
        idrings = np.asarray(results[0])
        cnt = np.asarray(results[1])

    # Maps are simply numpy arrays, where each array element refers to
    # a location in the sky as defined by the Healpix pixelization schemes.
    # The resolution of the map is defined by the 'nside' parameter
    # We create an empty map
    m = np.zeros(hp.nside2npix(nside),dtype='float32')
    # The nside2npix() function gives the number of pixel NPIX of the map

    for i, rid in enumerate(idrings):
        print "i = %s; rid = %s" % (i, rid)
        m[rid] = cnt[i]

    fig = pylab.figure(figsize=(12,8))

    hp.mollview(m, coord=['C'], nest=False, title='Hackathon: sample sky coverage', fig=1)
    #hp.mollzoom(m, coord=['C'], nest=False, title='IPHAS sky coverage', fig=1)
    hp.graticule()

    pylab.savefig(fsvg, dpi=400, bbox_inches='tight')
    pylab.close()
    t = round(1000 * (time.time() - t0), 3)
    print "# PY: (%s ms) Sky coverage figure: '%s'" % (t, fsvg)

    #return fsvg
    return

def main():
    conn = connect(hostname = 'localhost'
                  ,database = 'hackadb'
                  ,port = 53000
                  ,username = 'monetdb'
                  ,password = 'monetdb')
    #nside = 131072
    nside = int(sys.argv[1])
    #nside = 8
    #nside = 1024
    figname = sys.argv[2]
    get_skycovfig(conn, nside, figname)

if __name__ == "__main__":
    main()
