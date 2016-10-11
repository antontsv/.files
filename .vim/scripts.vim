if did_filetype() " filetype already set..
  finish          " ..don't do these checks
endif
if getline(1) =~ '^#!\(/usr\)\?/bin/\(env \)\?\(awesome-\)\?\(ba\)\?sh'
  " recognize /usr/bin/env bash and /usr/bin/env sh
  " recognize /bin/bash
  " recognize /usr/bin/env awesome-bash
  " (https://github.com/antontsv/awesome-shell)
  setfiletype sh
elseif getline(2) =~ '^Index: '
  setfiletype diff
endif

