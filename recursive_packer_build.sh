#!/bin/sh -x

build_all() {
    for packer_file in $(find . $(git submodule --quiet foreach --recursive 'pwd') -maxdepth '1' -type 'f' -name 'packer.json' | tac)
    do
        set -x
        env BUILD_REVISION="$(git rev-parse --prefix "$(dirname "${packer_file}")" --short @)" packer build "${packer_file}"
        set +x
    done
}