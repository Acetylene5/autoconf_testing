# ===========================================================================
# Supermongo macro
# ===========================================================================
#
# SYNOPSIS
#
#   AX_SUPERMONGO([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])
#
# DESCRIPTION
#
#   This macro looks for a library that implements the SuperMongo plotting
#   interface (see http://). On success, it sets the
#   SM_LIBS output variable to hold the requisite library linkages.
#
#   To link with SuperMongo, you should link with:
#
#     $SM_LIBS
#
#   ACTION-IF-FOUND is a list of shell commands to run if a SuperMongo library
#   is found, and ACTION-IF-NOT-FOUND is a list of commands to run it if it
#   is not found. If ACTION-IF-FOUND is not specified, the default action
#   will define HAVE_SUPERMONGO.
#
# LICENSE
#
#   Copyright (c) 2013 Casey Deen <deen@mpia.de>
#   Adapted from AX_LAPACK by Steven G. Johnson
#
#   This program is free software: you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation, either version 3 of the License, or (at your
#   option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
#   Public License for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program. If not, see <http://www.gnu.org/licenses/>.
#
#   As a special exception, the respective Autoconf Macro's copyright owner
#   gives unlimited permission to copy, distribute and modify the configure
#   scripts that are the output of Autoconf when processing the Macro. You
#   need not follow the terms of the GNU General Public License when using
#   or distributing such scripts, even though portions of the text of the
#   Macro appear in them. The GNU General Public License (GPL) does govern
#   all other use of the material that constitutes the Autoconf Macro.
#
#   This special exception to the GPL applies to versions of the Autoconf
#   Macro released by the Autoconf Archive. When you make and distribute a
#   modified version of the Autoconf Macro, you may extend this special
#   exception to the GPL to apply to your modified version as well.

#serial 7

AU_ALIAS([ACX_SUPERMONGO], [AX_SUPERMONGO])
AC_DEFUN([AX_SUPERMONGO], [
ax_supermongo_ok=no

AC_ARG_WITH(supermongo,
        [AS_HELP_STRING([--with-supermongo=<lib>], [use S.MONGO lib. <lib>])])
case $with_supermongo in
        yes | "") ;;
        no) ax_supermongo_ok=disable ;;
        -* | */* | *.a | *.so | *.so.* | *.o) SM_LIBS="$with_supermongo" ;;
        *) SM_LIBS="-l$with_supermongo" ;;
esac

# Get fortran linker name of SUPERMONGO function to check for.
AC_F77_FUNC(sm_graphics)

# First, check SUPERMONGO_LIBS environment variable
if test "x$SUPERMONGO_LIBS" != x; then
        save_LIBS="$LIBS"; LIBS="$SUPERMONGO_LIBS"
        AC_MSG_CHECKING([for $sm_graphics in $SUPERMONGO_LIBS])
        AC_TRY_LINK_FUNC($sm_graphics, [ax_supermongo_ok=yes], [SM_LIBS=""])
        AC_MSG_RESULT($ax_supermongo_ok)
        LIBS="$save_LIBS"
        if test $ax_supermongo_ok = no; then
                SM_LIBS=""
        fi
fi

AC_SUBST(SM_LIBS)

# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
if test x"$ax_supermongo_ok" = xyes; then
        ifelse([$1],,AC_DEFINE(HAVE_SUPERMONGO,1,[Define if you have SM library.]),[$1])
        :
else
        ax_supermongo_ok=no
        $2
fi
])dnl AX_SUPERMONGO
