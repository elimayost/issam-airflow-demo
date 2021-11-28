#!/bin/env bash

set -e

npm run build

mkdir -p ../docs

cp -r src/.vuepress/dist/* ../docs/
