#! /bin/bash

set -e

MAIN_TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# shellcheck disable=SC1091
source "${MAIN_TOP_DIR}/utils.sh"

DIST="${ROOT_DIR}/dist"

ensure_dir "${DIST}"
ensure_dir "${TMP_DIR}"

INFO "Build Main Document Started."

set -x

mkdocs build -v
npx mkdocs-render-math-ssr --srcDir="${ROOT_DIR}/site" --useWorker

set +x

INFO "Build Main Document Ended."

mv "${ROOT_DIR}/site"/* "${DIST}"

for dir in "${ROOT_DIR}/team"/*; do
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
