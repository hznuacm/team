#! /bin/bash

TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# shellcheck disable=SC1091
source "${TOP_DIR}/../../utils.sh"

DIST="${TOP_DIR}/TI1050"

git clone https://github.com/TI-1050/wiki.git -b gh-pages "${DIST}"

rm -rf "${DIST}/.git"

if [[ -d "${DIST}" ]]; then
    cp -a "${DIST}" "${TOP_DIR}/../../dist"
    rm -rf "${DIST}"
fi
