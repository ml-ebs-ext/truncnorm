#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>
#include <R_ext/Visibility.h>

SEXP C_do_rtruncnorm(SEXP s_n, SEXP s_a, SEXP s_b, SEXP s_mean, SEXP s_sd);

static const R_CallMethodDef R_CallDef[] = {
    {"C_do_rtruncnorm", (DL_FUNC) &C_do_rtruncnorm, 5},
    {NULL, NULL, 0}
};

void attribute_visible R_init_truncnorm(DllInfo *dll) {
    R_registerRoutines(dll, NULL, R_CallDef, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
    R_forceSymbols(dll, TRUE);
}