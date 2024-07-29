# Findstemmer.cmake - Locate libstemmer
#
# This module defines the following variables:
#   STEMMER_FOUND - system has libstemmer
#   STEMMER_INCLUDE_DIRS - the libstemmer include directories
#   STEMMER_LIBRARIES - link against this library to use libstemmer

include_guard(GLOBAL)

find_path(STEMMER_INCLUDE_DIR
  NAMES
    libstemmer.h
)

find_library(STEMMER_LIBRARY
  NAMES
    stemmer
    libstemmer
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(stemmer DEFAULT_MSG STEMMER_LIBRARY STEMMER_INCLUDE_DIR)

if (STEMMER_FOUND)
  set(STEMMER_LIBRARIES ${STEMMER_LIBRARY})
  set(STEMMER_INCLUDE_DIRS ${STEMMER_INCLUDE_DIR})
  add_library(stemmer STATIC IMPORTED GLOBAL)
  set_target_properties(
    stemmer
    PROPERTIES
      IMPORTED_LOCATION ${STEMMER_LIBRARY}
      INTERFACE_INCLUDE_DIRECTORIES ${STEMMER_INCLUDE_DIRS}
  )
  add_library(stemmer::stemmer ALIAS stemmer)
else()
  set(STEMMER_FOUND FALSE)
  message(FATAL_ERROR "Could not find libstemmer")
endif ()