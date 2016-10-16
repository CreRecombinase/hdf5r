#!/bin/sh
# config file to download pre-compiled windows libraries and headers 
# Adapted from Cairo package: 

echo "  checking hdf5 headers and libraries"
allok=yes

LIBWIN="$(echo ${LIB_HDF5}/lib${R_ARCH} | sed 's/\\/\//g')"
INC_HDF5=""

if [ ! -e ${LIBWIN}/libhdf5_cpp.a ]; then
	echo "  cannot find current hdf5 file(s) in ${LIBWIN}/libhdf5_cpp.a"
	echo "  attempting to download them"
	echo 'download.file("https://github.com/mannau/h5-libwin/archive/master.zip", destfile = "h5-libwin.zip")' | R --vanilla --slave
  if [ ! -e h5-libwin.zip ]; then
	  allok=no
  else
	  echo "  unpacking current hdf5"
	  unzip h5-libwin.zip
	  cp -rf h5-libwin-master/include inst
	  cp -rf h5-libwin-master/lib src
	  rm h5-libwin.zip
	  rm -rf h5-libwin-master
	  echo "src/lib/${R_ARCH}/libhdf5_cpp.a"
		if [ ! -e src/lib/${R_ARCH}/libhdf5_cpp.a ]; then
		  allok=no
		fi
		echo "inst/include/hdf5_cpp/H5Cpp.h"
		if [ ! -e inst/include/hdf5_cpp/H5Cpp.h ]; then
      allok=no
    fi
  fi
fi

if [ ${allok} != yes ]; then
    echo ""
    echo " *** ERROR: unable to find HDF5 files"
    echo ""
    echo " They must be in src/lib and inst/include"
    echo ""
    echo " You can get the latest binary ball from"
    echo " https://github.com/mannau/h5-libwin"
    echo ""
    exit 1
fi

echo "  seems ok, ready to go"
exit 0
