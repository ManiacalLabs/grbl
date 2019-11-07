# set -x
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

build_config() {
    d=$1
    echo "$d"
    cfg_name=$(basename -- "$d")
    mkdir -p "${BASE_BUILD_DIR}/$cfg_name"
    mkdir -p "${BASE_CODE_DIR}/$cfg_name/grbl/"
    cp -r ./grbl/* "${BASE_CODE_DIR}/$cfg_name/grbl/"
    cp -rf ${d}/* "${BASE_CODE_DIR}/$cfg_name/grbl/"

    arduino --verify --board arduino:avr:nano:cpu=atmega328 --pref build.path="${BASE_BUILD_DIR}/$cfg_name" --pref compiler.warning_level="none" "${BASE_CODE_DIR}/$cfg_name/grbl/grbl.ino" 2>&1 | awk '!/javax/'
    
    cp "${BASE_BUILD_DIR}/$cfg_name/grbl.ino.hex" "${BASE_RELEASE_DIR}/$cfg_name.hex"
}

if [[ -z $1 ]]; then
    for d in ./configs/*/;
    do
        build_config $d
    done
else
    for d in "$@"
do
    build_config "./configs/$d"
done
fi

