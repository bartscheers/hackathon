At the ASTRON Hackathon
=======================

Statistical querying of astronomical databases
----------------------------------------------

We are working on a dataset of 2M (unique) sources from the 
IPHAS survey.
The csv file is available at `here`_.



Install & run
-------------

- Install the MonetDB database (`get it from here`_)

- Start the daemon (``monetdbd``)

- Create and start the database instance (``createstartdb.sh``). The database instance is named hackadb. Note that we set ``embedpy=true``.

- Create the ``runcat`` table into which the data from the csv file will be loaded, and actually load the data (``load.sh``).

Now all data should be loaded

Create the UDFs
---------------

- Run ``createudfs.sh`` to create the sql/python udfs. One calculates the chi squared probability and the other renders the healpix number given the map resolution that contains the point position on the sphere.

- See it in action, ``runhealpyudf.sh`` that executes the example query (`sql/examplehealpix.sql`) using the healpy functionality.

.. _get it from here: https://www.monetdb.org/Downloads/ReleaseNotes
.. _here: https://homepages.cwi.nl/~bscheers/hackathon/hackathon_dump.csv

