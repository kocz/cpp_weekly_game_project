macro(run_conan)
# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(
    STATUS
      "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
       "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_add_remote(NAME bincrafters URL
                 https://api.bintray.com/conan/bincrafters/public-conan)

conan_cmake_run(
  REQUIRES
  ${CONAN_EXTRA_REQUIRES}
  catch2/2.11.0
  docopt.cpp/0.6.2
  fmt/8.0.1
  spdlog/1.9.2
  nlohmann_json/3.9.0
  OPTIONS
  ${CONAN_EXTRA_OPTIONS}
  BASIC_SETUP
  CMAKE_TARGETS # individual targets to link to
  BUILD
  missing)
endmacro()
