cmake_minimum_required(VERSION 3.12)



set(LIBCXX_REPOSITORY https://github.com/llvm-mirror/libcxx.git)
set(LLDB_REPOSITORY https://github.com/llvm-mirror/lldb.git)

set(LLD_REPOSITORY https://github.com/llvm-mirror/lld.git)
set(OPENMP_REPOSITORY https://github.com/llvm-mirror/openmp.git)
set(POLLY_REPOSITORY https://github.com/llvm-mirror/polly.git)
set(ZORG_REPOSITORY https://github.com/llvm-mirror/zorg.git)
set(CXXABI_REPOSITORY https://github.com/llvm-mirror/libcxxabi.git)
set(LIBUNWIND_REPOSITORY https://github.com/llvm-mirror/libunwind.git)
set(PSTL_REPOSITORY https://github.com/llvm-mirror/pstl.git)
set(TEST_SUITE_REPOSITORY https://github.com/llvm-mirror/test-suite.git)
set(LIBCLC_REPOSITORY https://github.com/llvm-mirror/libclc.git)
set(LLGO_REPOSITORY https://github.com/llvm-mirror/llgo.git)
set(PARALLEL_LIBS_REPOSITORY https://github.com/llvm-mirror/parallel-libs.git)
set(POOLALLOC_REPOSITORY https://github.com/llvm-mirror/poolalloc.git)



find_package(Git)









#
# ... LLVM
#
set(LLVM_REPOSITORY https://github.com/llvm-mirror/llvm.git)
set(LLVM_SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/llvm)

if(EXISTS ${LLVM_SOURCE_DIR})
  execute_process(
    COMMAND ${GIT_EXECUTABLE} pull
    WORKING_DIRECTORY ${LLVM_SOURCE_DIR})
else()
  execute_process(
    COMMAND ${GIT_EXECUTABLE} clone ${LLVM_REPOSITORY} ${LLVM_SOURCE_DIR}
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
endif()



#
# ... Clang
#

set(CLANG_REPOSITORY https://github.com/llvm-mirror/clang.git)
set(CLANG_SOURCE_DIR ${LLVM_SOURCE_DIR}/tools/clang)
get_filename_component(CLANG_PARENT_DIR ${CLANG_SOURCE_DIR} DIRECTORY)

if(EXISTS ${CLANG_SOURCE_DIR})
  execute_process(
    COMMAND ${GIT_EXECUTABLE} pull
    WORKING_DIRECTORY ${CLANG_SOURCE_DIR})
elseif(EXISTS ${CLANG_PARENT_DIR})
    execute_process(
    COMMAND ${GIT_EXECUTABLE} clone ${CLANG_REPOSITORY} ${CLANG_SOURCE_DIR}
    WORKING_DIRECTORY ${CLANG_PARENT_DIR})
else()
  message(FATAL_ERROR
    "\n${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}:0 Bad state\nThe directory for clang is missing\n")
endif()


#
# ... Clang Tools
#
set(CLANG_TOOLS_REPOSITORY https://github.com/llvm-mirror/clang-tools-extra.git)
set(CLANG_TOOLS_SOURCE_DIR ${CLANG_SOURCE_DIR}/tools/extra)
get_filename_component(CLANG_TOOLS_PARENT_DIR ${CLANG_TOOLS_SOURCE_DIR} DIRECTORY)

if(EXISTS ${CLANG_TOOLS_SOURCE_DIR})
  execute_process(
    COMMAND ${GIT_EXECUTABLE} pull
    WORKING_DIRECTORY ${CLANG_TOOLS_SOURCE_DIR})
elseif(EXISTS ${CLANG_TOOLS_PARENT_DIR})
  execute_process(
    COMMAND ${GIT_EXECUTABLE} clone ${CLANG_TOOLS_REPOSITORY} ${CLANG_TOOLS_SOURCE_DIR}
    WORKING_DIRECTORY ${CLANG_TOOLS_PARENT_DIR})
else()
  message(FATAL_ERROR
    "\n${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}:0 Bad state\nThe directory for clang tools is missing\n")
endif()


#
# ... Compiler RT
#
set(COMPILER_RT_REPOSITORY https://github.com/llvm-mirror/compiler-rt.git)
set(COMPILER_RT_SOURCE_DIR ${LLVM_SOURCE_DIR}/projects/compiler-rt)
get_filename_component(COMPILER_RT_PARENT_DIR ${COMPILER_RT_SOURCE_DIR} DIRECTORY)
if(EXISTS ${COMPILER_RT_SOURCE_DIR})
  execute_process(
    COMMAND ${GIT_EXECUTABLE} pull
    WORKING_DIRECTORY ${COMPILER_RT_SOURCE_DIR})
elseif(EXISTS ${COMPILER_RT_PARENT_DIR})
  execute_process(
    COMMAND ${GIT_EXECUTABLE} clone ${COMPILER_RT_REPOSITORY}
    WORKING_DIRECTORY ${COMPILER_RT_PARENT_DIR})
else()
 message(FATAL_ERROR
    "\n${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}:0 Bad state\nThe directory for compiler-rt is missing\n")
endif()











