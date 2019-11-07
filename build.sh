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

for d in ./configs/*/;
do
    echo "$d"
    cfg_name=$(basename -- "$d")
    mkdir -p "${BASE_BUILD_DIR}/$cfg_name"
    mkdir -p "${BASE_CODE_DIR}/$cfg_name/grbl/"
    cp -r ./grbl/* "${BASE_CODE_DIR}/$cfg_name/grbl/"
    cp -rf ${d}/* "${BASE_CODE_DIR}/$cfg_name/grbl/"

    arduino --verify --board arduino:avr:nano:cpu=atmega328 --pref build.path="${BASE_BUILD_DIR}/$cfg_name" "${BASE_CODE_DIR}/$cfg_name/grbl/grbl.ino"

    cp "${BASE_BUILD_DIR}/$cfg_name/grbl.ino.hex" "${BASE_RELEASE_DIR}/$cfg_name.hex"
done

