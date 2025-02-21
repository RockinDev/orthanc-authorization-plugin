#!/usr/bin/sh

set -e

echo "Building orthanc-authorization-plugin..."

docker build -t orthanc-authorization-plugin .
