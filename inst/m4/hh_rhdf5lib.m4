
#############################################################################
##
## Copyright 2016 Novartis Institutes for BioMedical Research Inc.
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
#############################################################################

AC_DEFUN([HH_RHDF5LIB], [

AC_REQUIRE([AC_PROG_SED])
AC_REQUIRE([AC_PROG_AWK])
AC_REQUIRE([AC_PROG_GREP])

if test "$with_hdf5" != "yes"; then

RHDF5LIB_INSTALLED=$(echo 'cat(suppressWarnings(require(Rhdf5lib, quietly=TRUE, character.only=FALSE, warn.conflicts=FALSE)))' | "${R_HOME}/bin/R" --vanilla --slave)


if test "$RHDF5LIB_INSTALLED" != "TRUE"; then
   with_hdf5="no"
else
   with_hdf5="yes"
   ## get the relevant variables so that headers can be found and static library can be linked
   HDF5_LIBS=$(echo 'cat(Rhdf5lib::pkgconfig("PKG_C_HL_LIBS"))' | "${R_HOME}/bin/R" --vanilla --slave)
   RHDF5LIB_INCLUDEPATH=$(echo 'cat(system.file("include",package="Rhdf5lib"))' | "${R_HOME}/bin/R" --vanilla --slave)
   HDF5_VERSION==$(echo 'cat(Rhdf5lib::getHdf5Version())' | "${R_HOME}/bin/R" --vanilla --slave)
   HDF5_MAJOR_VERSION=$(echo 'cat(package_version(Rhdf5lib::getHdf5Version())$major)' | "${R_HOME}/bin/R" --vanilla --slave)
   HDF5_MINOR_VERSION=$(echo 'cat(package_version(Rhdf5lib::getHdf5Version())$major)' | "${R_HOME}/bin/R" --vanilla --slave)

   #HDF5_LIBS='-L"'${RHDF5LIB_LIBPATH}'" -lhdf5_hl-static -lhdf5-static -lz -lm'
   HDF5_CPPFLAGS='-I'"${RHDF5LIB_INCLUDEPATH}"#' -DWINDOWS'

   AC_SUBST([HDF5_LIBS])
   AC_SUBST([HDF5_CPPFLAGS])
   AC_SUBST([HDF5_VERSION])
   AC_SUBST([HDF5_MAJOR_VERSION])
   AC_SUBST([HDF5_MINOR_VERSION])
fi

fi

])
