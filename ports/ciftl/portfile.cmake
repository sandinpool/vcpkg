vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sandinpool/ciftl
    REF v1.0.1
    SHA512 d10fb3e1972c6d64f046280e2925eda606447c7e69e824a40e509a53f82f04bc1ccb04cdc7099bee1ef8480a24f4693cbd31573b5ba2a21815da5edbc8c44a5d
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/ciftl)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# 安装许可证文件
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/ciftl" RENAME copyright)
