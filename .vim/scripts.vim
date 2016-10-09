if did_filetype() " filetype already set..
  finish          " ..don't do these checks
endif
if getline(1) =~ '^#!/bin/\(ba\)?sh'
  setfiletype sh
elseif getline(1) =~ '^#!/usr/bin/env awesome-bash'
  setfiletype sh
elseif getline(2) =~ '^Index: '
  setfiletype diff
endif

