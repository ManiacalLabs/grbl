set -x
set -e
BASE_BUILD_DIR="./build/builds"
BASE_CODE_DIR="./build/code"
BASE_RELEASE_DIR="./build/release"
mkdir -p ${BASE_BUILD_DIR}
rm -rf "${BASE_BUILD_DIR}/*"

mkdir -p ${BASE_CODE_DIR}
rm -rf "${BASE_CODE_DIR}/*"

mkdir -p ${BASE_RELEASE_DIR}
rm -rf "${BASE_RELEASE_DIR}/*"

for f in ./configs/*.h;
do
    echo "$f"
    filename=$(basename -- "$f")
    cfg_name="${filename%.*}"
    mkdir -p "${BASE_BUILD_DIR}/$cfg_name"
    mkdir -p "${BASE_CODE_DIR}/$cfg_name/grbl/"
    cp -r ./grbl/* "${BASE_CODE_DIR}/$cfg_name/grbl/"
    cp -f ${f} "${BASE_CODE_DIR}/$cfg_name/grbl/config.h"

    arduino --verify --board arduino:avr:uno --pref build.path="${BASE_BUILD_DIR}/$cfg_name" "${BASE_CODE_DIR}/$cfg_name/grbl/grbl.ino"

    cp "${BASE_BUILD_DIR}/$cfg_name/grbl.ino.hex" "${BASE_RELEASE_DIR}/$cfg_name.hex"
done

