#! /bin/bash

ROOT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

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

export ROOT_DIR
