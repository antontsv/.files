# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
export DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

[ -r "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh


[ -r  "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

OS=$(uname -s)

# Pick up bash completion rules
autoload bashcompinit
bashcompinit

configFileExtensions=("")
if [[ "$OS" == "Darwin" ]]; then
    configFileExtensions+=("*.macos")
fi;
configFileExtensions+=("*.extra")

sourced=()
for configType in {env_vars,aliases,functions,path,completion}; do
    for ext in "${configFileExtensions[@]}"; do
        for configFile in $(find "$HOME/.sh" -name "${configType}$ext"); do
           [ -f "$configFile" ] && sourced+=("$configFile") && source "$configFile"
        done
    done;
done;

for configFile in $(find "$HOME/.sh" -name "*.extra"); do
    [ -f "$configFile" ] && ! [[ "${sourced[@]}" == *"$configFile"* ]] && source "$configFile"
done;