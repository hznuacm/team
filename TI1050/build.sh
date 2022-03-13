#! /bin/bash

TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

DIST="${TOP_DIR}/TI1050"

git clone https://github.com/TI-1050/wiki.git -b gh-pages "${DIST}"

mv "${DIST}" "${TOP_DIR}/../dist"
