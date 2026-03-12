#!/bin/bash

set -euxo pipefail

# ensure working directory is project root
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
cd "${root_dir}"

echo "TODO"
