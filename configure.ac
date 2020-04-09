AC_INIT([hdf5r], 0.1.0, [hhoeflin@gmail.com])

dnl Grab that macro that checks for HDF5 availability
m4_include([inst/m4/ax_lib_hdf5.m4])
m4_include([inst/m4/ax_compare_version.m4])
m4_include([inst/m4/hh_hdf5rlib.m4])
m4_include([inst/m4/hh_rhdf5lib.m4])

HH_RHDF5LIB()

if test "$with_hdf5" != "yes"; then

AX_LIB_HDF5()

fi


if test "$with_hdf5" = "yes"; then
AC_MSG_RESULT([Found hdf5 with version: $HDF5_VERSION])
AX_COMPARE_VERSION([$HDF5_VERSION], [ge], [1.8.13], [hdf5_version_sufficient="yes"], AC_MSG_ERROR([The version of hdf5 installed on your system is not sufficient. Please ensure that at least version 1.8.13 is installed]))
else 
  AC_MSG_ERROR([hdf5 does not seem to be installed on your platform.
  Please install the hdf5 library.
  The required HDF5 library files can be installed as follows:
      - Debian-based (e.g. Debian >= 8.0, Ubuntu >= 15.04): 'sudo apt-get install libhdf5-dev'
        - Old Debian-based (e.g Debian < 8.0, Ubuntu < 15.04): Install from source (see INSTALL)
        - OS X using Homebrew: 'brew install hdf5'
        - RPM-based (e.g Fedora): 'sudo yum install hdf5-devel'])
fi


if test "$hdf5_version_sufficient" = "yes"; then 
  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.8.13], 
	[HDF5_VERSION_USE="1_8_14"])

  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.8.14], 
	[HDF5_VERSION_USE="1_8_14"])

  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.8.16], 
	[HDF5_VERSION_USE="1_8_16"])

  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.10.0], 
	[HDF5_VERSION_USE="1_10_0"])

  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.10.2], 
	[HDF5_VERSION_USE="1_10_2"])

  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.10.3], 
	[HDF5_VERSION_USE="1_10_3"])
	
  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.10.4], 
	[HDF5_VERSION_USE="1_10_3"])
	
  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.12.0], 
	[HDF5_VERSION_USE="1_12_0"])
  
  AX_COMPARE_VERSION(
	[$HDF5_VERSION], 
	[ge], 
	[1.12.0], 
	[HDF5_API_VERS_USE="-DH5_USE_110_API"],
    [HDF5_API_VERS_USE=""])
fi

AC_SUBST(HDF5_VERSION_USE)
AC_SUBST(HDF5_API_VERS_USE)
AC_SUBST(DEFINE_H5FREE_MEMORY)



dnl dnl Now find the compiler and compiler flags to use
dnl : ${R_HOME=`R RHOME`}
dnl if test -z "${R_HOME}"; then
dnl   echo "could not determine R_HOME"
dnl   exit 1
dnl fi

dnl if test -z "${LIBS}"; then
dnl   dnl prefer ggrep if installed
dnl   AC_CHECK_PROG(GREP,ggrep,`which ggrep`, `which grep`)

dnl   dnl check if $GREP supports option -o
dnl   AC_MSG_CHECKING([whether ${GREP} accepts -o])
dnl   if `echo '' | ${GREP} -o '' >/dev/null 2>&1`
dnl   then
dnl     AC_MSG_RESULT([yes])
dnl   else
dnl     AC_MSG_RESULT([no])
dnl     AC_MSG_ERROR([${GREP} does not support option -o])
dnl   fi
dnl   [
dnl   LIBS=`${H5CC} -show | ${GREP} -o "\-L[^[:space:]]\+" | tr "\n" " "`
dnl   ]
  
dnl   dnl Fix for newer Debian versions
dnl   HDF5R_LIBS="${LIBS} -L. -lhdf5_hl -lhdf5 -lz -lm"

dnl fi

dnl if test -z "${CPPFLAGS}"; then
dnl   dnl prefer ggrep if installed
dnl   AC_CHECK_PROG(GREP,ggrep,`which ggrep`, `which grep`)

dnl   dnl check if $GREP supports option -o
dnl   AC_MSG_CHECKING([whether ${GREP} accepts -o])
dnl   if `echo '' | ${GREP} -o '' >/dev/null 2>&1`
dnl   then
dnl     AC_MSG_RESULT([yes])
dnl   else
dnl     AC_MSG_RESULT([no])
dnl     AC_MSG_ERROR([${GREP} does not support option -o])
dnl   fi

dnl   echo 'int main() { return; }' > myconftest.c


dnl   [
dnl   HDF5R_CPPFLAGS=`${H5CC} -show -c myconftest.c | ${GREP} -o "\-I[^[:space:]]\+" | tr "\n" " "`
dnl   ]
dnl   rm -f myconftest.c
dnl fi

dnl dummy substitute HDF5R_CFLAGS
dnl HDF5R_CFLAGS=""
AC_SUBST(HDF5_CFLAGS)

dnl substitute CPPFLAGS and LIBS
AC_SUBST(HDF5_CPPFLAGS)
AC_SUBST(HDF5_LIBS)
dnl and do subsitution in the src/Makevars.in 
AC_CONFIG_FILES([src/Makevars])
AC_OUTPUT



