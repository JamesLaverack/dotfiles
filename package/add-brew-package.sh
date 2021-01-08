#!/usr/bin/env bash

new_package="$1"

set -euf -o pipefail

if [ -z "${new_package}" ]
then
    echo "New package name not provided."
    exit 1
fi

echo "Adding new package to list '${new_package}'"
echo "${new_package}" >> brew.txt
sort brew.txt > sorted.txt
rm brew.txt
mv sorted.txt brew.txt
echo "Added. You may want to re-run the setup script to have brew install it."
