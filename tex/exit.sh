#!/usr/bin/env bash
kill $ZATHURAPID
kill $TECTONICPID
pushd src > /dev/null
latexindent.pl -wd -s index.tex
rm -f index.bak* indent.log
popd > /dev/null
