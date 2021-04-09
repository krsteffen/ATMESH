cmake_minimum_required(VERSION 3.16.1)
project(libatmesh Fortran)

find_package(MPI REQUIRED)
find_package(NetCDF REQUIRED C Fortran)
find_package(ESMF MODULE REQUIRED)

add_library(atmesh STATIC ${CMAKE_SOURCE_DIR}/src/atmesh.F90 ${CMAKE_SOURCE_DIR}/src/atmesh_mod.F90)
target_link_libraries(atmesh PRIVATE MPI::MPI_Fortran NetCDF::NetCDF_Fortran esmf)
