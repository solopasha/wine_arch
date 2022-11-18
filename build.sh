#!/bin/bash
set -eux

build() {
  pushd $1
  shift
  /usr/bin/makechrootpkg -r /var/lib/archbuild/multilib-build -U builduser -- -r --skippgpcheck $@
  popd
}

multilib-build -c || true
build wine
