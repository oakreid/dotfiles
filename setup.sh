#!/bin/bash

set -euxo pipefail

# ensure working directory is project root
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
cd "${root_dir}"

subdirs=( $(find user/ -mindepth 1 -type d | cut -d '/' -f1 --complement) )
for path in "${subdirs[@]}"; do
    mkdir -p "${HOME}/${path}"
done

dotfiles=( $(find user/ -mindepth 1 -type f | cut -d '/' -f1 --complement) )
for path in "${dotfiles[@]}"; do
    ln -sf "$(pwd)/user/${path}" "${HOME}/${path}"
done
