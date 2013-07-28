AC_PREREQ([2.59])
AC_INIT([test.f], [version_1.0],[deen@mpia.de])
AM_INIT_AUTOMAKE([foreign])
AC_PROG_F77([gfortran])
AC_CONFIG_MACRO_DIR([m4])

AC_CONFIG_FILES([
    Makefile
    src/Makefile
])

sinclude(m4/ax_blas.m4)
sinclude(m4/ax_lapack.m4)
sinclude(m4/ax_supermongo.m4)
#SMLIB="/usr/local/misc/sm/sm2_4_36/lib/"
AX_LAPACK
AX_SUPERMONGO
LIBS="$SM_LIBS $LAPACK_LIBS $BLAS_LIBS $FLIBS $LIBS"
#LIBS="$LAPACK_LIBS $BLAS_LIBS $FLIBS $LIBS"
AC_OUTPUT
