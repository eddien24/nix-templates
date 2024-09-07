#!/usr/bin/env bash
latexindent.pl -wd -s src/index.tex
pkill zathura
pkill tectonic
pushd src
rm -f index.bak* indent.log
popd
