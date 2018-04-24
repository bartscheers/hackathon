CREATE OR REPLACE FUNCTION ang2pix(nside INTEGER, theta DOUBLE, phi DOUBLE) 
RETURNS BIGINT
LANGUAGE PYTHON {
    
    import healpy 
    ringids = healpy.ang2pix(nside, theta, phi, nest=False)
    return ringids

};
