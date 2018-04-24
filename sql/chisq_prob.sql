CREATE FUNCTION chisq_prob(chisq DOUBLE, dof INT)
RETURNS DOUBLE
LANGUAGE PYTHON {

    from scipy import stats
    return 1 - stats.chi2.cdf(chisq, dof)

};

