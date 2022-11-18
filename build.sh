#!/bin/bash
set -eux

build() {
  pushd $1
  shift
  /usr/bin/makechrootpkg -r /var/lib/archbuild/multilib-x86_64 -U builduser -- -r --skippgpcheck $@
  popd
}

multilib-build -c || true
build wine
