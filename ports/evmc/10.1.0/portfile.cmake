vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/evmc
    REF d262709028f19e7dcf8cd64856ac77ea8a98d923
    SHA512 aaf35328060423ba470d2315d771871af6e925cb10162768311988980a80cc386e82b22348fb019600047de36f0afeb131ce79a3dace609a9a003f9bfb3c95c0
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF -DEVMC_TESTING=OFF -DEVMC_TOOLS=OFF -DHUNTER_ENABLED=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/evmc)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)