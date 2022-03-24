#! /bin/bash

UTILS_TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

export ROOT_DIR="${UTILS_TOP_DIR}"
export TMP_DIR="${ROOT_DIR}/tmp"

function get_now_time() {
    NOW_TIME=$(date)
    echo "${NOW_TIME}"
}

function INFO() {
    echo -e "\033[0;32m$(get_now_time) [INFO]: $*\033[0m"
}

function ERROR() {
    echo -e "\033[0;31m$(get_now_time) [ERROR]: $*\033[0m"
}

function ensure_dir() {
    dir="${1}"

    if [[ -d "${dir}" ]]; then
        rm -rf "${dir}"
    fi

    mkdir "${dir}"
}
