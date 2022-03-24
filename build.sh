#! /bin/bash

MAIN_TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# shellcheck disable=SC1091
source "${MAIN_TOP_DIR}/utils.sh"

DIST="${MAIN_TOP_DIR}/dist"

if [[ -d "${DIST}" ]]; then
    rm -rf "${DIST}"
fi

mkdir "${DIST}"

for dir in "${MAIN_TOP_DIR}/team"/*; do
    if [[ ! -d "${dir}" ]]; then
        continue
    fi

    BUILD_SCRIPT="${dir}/build.sh"

    INFO "Build ${dir} Started."

    if [[ -f "${BUILD_SCRIPT}" ]]; then
        bash -ex "${BUILD_SCRIPT}"
    fi

    INFO "Build ${dir} Ended."
done
