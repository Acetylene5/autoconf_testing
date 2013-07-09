AC_PREREQ([2.59])
AC_INIT([test.f], [version_1.0],[deen@mpia.de])

AC_PROG_F77([gfortran])
AC_CONFIG_MACRO_DIR([m4])

AX_LAPACK

#AX_BLAS([have_blas=yes], [have_blas=no])
#if test "x${have_blas}" = xno; then
#    AC_MSG_ERROR([
#       ------------------------------------------
#       A BLAS library and header file required to build csdp. Stopping...
#       Check 'config.log' for more information.
#       ------------------------------------------])
#fi

AC_OUTPUT(Makefile)
