setopt interactivecomments # allow comments that begin with '#'

# Pick up bash completion rules
autoload -U compaudit compinit bashcompinit
bashcompinit
compinit

[ -r  "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

OS=$(uname -s)
configFileExtensions=("")
if [[ "$OS" == "Darwin" ]]; then
    configFileExtensions+=("*.macos")
fi;
configFileExtensions+=("*.extra")

sourced=()
for configType in {env_vars,aliases,functions,path,completion}; do
    for ext in "${configFileExtensions[@]}"; do
        while IFS= read -r -d '' configFile
        do
            [ -f "$configFile" ] && sourced+=("$configFile") && source "$configFile"
        done <   <(find "$HOME/.sh" -name "${configType}$ext" -print0)
    done;
done;

while IFS= read -r -d '' configFile
do
  if [ -f "$configFile" ] && [[ ! "${sourced[*]}" == *"$configFile"* ]];then
   source "$configFile"
  fi;
done <   <(find "$HOME/.sh" -name '*.extra' -print0)

#########################
#  Prompt customization #
#########################

setopt PROMPT_SUBST;
PS1='$(_last_cmd_ps1)'; # visualize exit status of last command
if [ -n "${TMUX}" ] ; then
    PS1+='${FG_CYAN}<t>'; # indicate if running in tmux
elif [ -n "$STY" ] || [[ "x$TERM" = "xscreen"* ]]; then
    PS1+='${FG_CYAN}<s>'; # indicate if running in screen
fi;
if [ -n "${SSH_TTY}" ]; then
    PS1+='${FG_YELLOW}%m:'; # if connected via ssh print hostname as well
fi;
PS1+='${FONT_RESET}${FONT_BOLD}${FG_BLUE}%~'; # print working directory
if type '__git_ps1' > /dev/null; then
    PS1+='${FG_RED}$(__git_ps1 "|%s")' # more info from git (if available)
fi;
PS1+='${FONT_RESET}
%% ' # reset colors and move to a new line


##############################################
# ENABLE Oh My ZSH if installed and requested
#############################################
if [ -n "$OH_MY_ZSH_PATH" ] && [ -r "$OH_MY_ZSH_PATH/oh-my-zsh.sh" ];then
    export ZSH="$OH_MY_ZSH_PATH"

    # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
    ZSH_THEME=""

    DISABLE_AUTO_UPDATE="true"

    # This makes repository status check for large repositories
    # much, much faster.
    export DISABLE_UNTRACKED_FILES_DIRTY="true"

    # Which plugins would you like to load?
    # Standard plugins can be found in $ZSH/plugins/
    # Custom plugins may be added to $ZSH_CUSTOM/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # Add wisely, as too many plugins slow down shell startup.
    plugins=(git)

    source $ZSH/oh-my-zsh.sh
fi;

# Keybindings regardless of oh-my-zsh presence
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^k' kill-line
bindkey '^r' history-incremental-search-backward
bindkey '^u' kill-whole-line