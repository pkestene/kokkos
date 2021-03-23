include(FindPackageHandleStandardArgs)

FIND_LIBRARY(AMD_HIP_LIBRARY amdhip64 PATHS ENV ROCM_PATH PATH_SUFFIXES lib)
FIND_LIBRARY(HSA_RUNTIME_LIBRARY hsa-runtime64 PATHS ENV ROCM_PATH PATH_SUFFIXES lib)

find_package_handle_standard_args(TPLROCM DEFAULT_MSG AMD_HIP_LIBRARY HSA_RUNTIME_LIBRARY)

kokkos_create_imported_tpl(ROCM INTERFACE
  LINK_LIBRARIES ${HSA_RUNTIME_LIBRARY} ${AMD_HIP_LIBRARY}
  COMPILE_OPTIONS -D__HIP_ROCclr__
)