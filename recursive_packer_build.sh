#!/bin/sh -x

build_all() {
    for packer_file in $(find . $(git submodule --quiet foreach --recursive 'pwd') -maxdepth '1' -type 'f' -name 'packer.json' | tac)
    do
        set -x
        packer build "${packer_file}"
        set +x
    done
}