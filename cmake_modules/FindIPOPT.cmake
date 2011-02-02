find_package(LAPACK)
find_package(Threads)

FIND_PATH(IPOPT_INCLUDE_DIR 
coin/IpIpoptApplication.hpp
HINTS $ENV{IPOPT}/include
)

IF (IPOPT_INCLUDE_DIR)
   SET(IPOPT_FOUND_INCLUDE TRUE)
   MESSAGE(STATUS "Found IPOPT include dir: ${IPOPT_INCLUDE_DIR}")
ELSE (IPOPT_INCLUDE_DIR)
   MESSAGE(STATUS "Could not find IPOPT include dir")
ENDIF (IPOPT_INCLUDE_DIR)

FIND_LIBRARY(IPOPT_LIBRARY NAMES ipopt HINTS /usr/local/lib/coin /usr/local/lib/coin/ThirdParty $ENV{IPOPT}/coin/lib/ $ENV{IPOPT}/coin/lib/ThirdParty/ $ENV{IPOPT}/lib/)

MESSAGE(STATUS "${PTHREAD_LIBRARIES}")

IF (IPOPT_LIBRARY)
   SET(IPOPT_FOUND_LIBS TRUE)
   SET(IPOPT_LIBRARIES ${IPOPT_LIBRARY} ${IPOPT_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} ${LAPACK_LIBRARIES} ${EXTRA_LIBRARIES} -ldl) 
   MESSAGE(STATUS "Found Ipopt libs: ${IPOPT_LIBRARIES}")
ELSE (IPOPT_LIBRARY)
   MESSAGE(STATUS "Could not find Ipopt libs")
ENDIF (IPOPT_LIBRARY)

IF(IPOPT_FOUND_INCLUDE AND IPOPT_FOUND_LIBS)
  SET(IPOPT_FOUND TRUE)
ENDIF(IPOPT_FOUND_INCLUDE AND IPOPT_FOUND_LIBS)
