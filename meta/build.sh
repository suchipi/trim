#!/usr/bin/env bash
set -ex

PROGRAM_NAME="@trim"
PROGRAM_SOURCE="src/trim.js"

if [ ! -e 'meta/quickjs' ]; then
  meta/scripts/clone-quickjs.sh
fi

# build quickjs
if [[ "$SKIP_QJS" == "" ]]; then
  pushd meta/quickjs > /dev/null
  meta/build.sh
  popd > /dev/null
fi

mkdir -p bin

cat meta/quickjs/build/bin/qjsbootstrap "$PROGRAM_SOURCE" > "bin/$PROGRAM_NAME"
chmod +x "bin/$PROGRAM_NAME"
