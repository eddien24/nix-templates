#!/usr/bin/env bash
pkill zathura
pkill tectonic
pushd src > /dev/null
latexindent.pl -wd -s index.tex
rm -f index.bak* indent.log
popd > /dev/null
