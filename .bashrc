
OS=$(uname -s)

configFileExtensions=("")
if [ "$OS" = "Darwin" ]; then
    configFileExtensions+=(".macos")
fi;
configFileExtensions+=(".extra")

sourced=()
for configType in {env_vars,aliases,functions,path,completion}; do
    for ext in "${configFileExtensions[@]}"; do
        configFile="$HOME/.sh/${configType}$ext"
         [ -f "$configFile" ] && sourced+=("$configFile") && source "$configFile"
    done;
done;

for configFile in "$HOME"/.sh/*.extra; do
    [ -f "$configFile" ] && ! [[ "${sourced[@]}" == *"$configFile"* ]] && source "$configFile"
done;

# Make sure any modifications to PATH are propagated
export PATH

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Check and use color prompt whenever possible
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

# Indicate chroot (if any)
PS1='${debian_chroot:+($debian_chroot)}'

if [ "$color_prompt" = yes ]; then
    PS1+='$(_last_cmd_ps1)'; # visualise exit status of last command
    if [ -n "${TMUX}" ] ; then
        PS1+='${FG_CYAN}<t>'; # indicate if running in tmux
    elif [ -n "$STY" ] || [ "x$TERM" = "xscreen" ]; then
        PS1+='${FG_CYAN}<s>'; # indicate if running in screen
    fi;
    if [ -n "${SSH_TTY}" ]; then
        PS1+='${FG_YELLOW}\h:'; # if connected via ssh print hostname as well
    fi;
    PS1+='${FONT_RESET}${FONT_BOLD}${FG_BLUE}\w'; # print working directory
    if [ "x$(type -t __git_ps1)" = "xfunction" ]; then
        PS1+='${FG_RED}$(__git_ps1 "|%s")' # more info from git (if available)
    fi;
    PS1+='${FONT_RESET}\n\$ ' # reset colors and move to a new line
else
    PS1+='\u@\h:\w\$ ' # basic info if no colors supported: user, host, working directory
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi
