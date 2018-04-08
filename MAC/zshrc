# =============================================================================
#                                   Functions
# =============================================================================
powerlevel9k_random_color(){
    local code
    #for code ({000..255}) echo -n "$%F{$code}"
    #code=$[${RANDOM}%11+10]    # random between 10-20
    code=$[${RANDOM}%211+20]    # random between 20-230
    printf "%03d" $code
}

zsh_wifi_signal(){
    local signal=$(nmcli -t device wifi | grep '^*' | awk -F':' '{print $6}')
    local color="yellow"
    [[ $signal -gt 75 ]] && color="green"
    [[ $signal -lt 50 ]] && color="red"
    echo -n "%F{$color}\uf1eb" # \uf1eb is 
}

# =============================================================================
#                                   Variables
# =============================================================================
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed

[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zsh-users
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

#zplug "zsh-users/zsh-completions",              defer:0
#zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
#zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
#zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# oh-my-zsh
#zplug "zplug/zplug"
#zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# Supports oh-my-zsh plugins and the like
if [[ $OSTYPE = (linux)* ]]; then
    zplug "plugins/archlinux", from:oh-my-zsh, if:"which pacman"
    zplug "plugins/dnf",       from:oh-my-zsh, if:"which dnf"
fi

if [[ $OSTYPE = (darwin)* ]]; then
    zplug "plugins/osx",      from:oh-my-zsh
    zplug "plugins/brew",     from:oh-my-zsh, if:"which brew"
    zplug "plugins/macports", from:oh-my-zsh, if:"which port"
fi

zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/common-aliase", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/copydir", from:oh-my-zsh
zplug "plugins/copyfile", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/dircycle", from:oh-my-zsh
zplug "plugins/encode64", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/nmap",   from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "plugins/urltools", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/go", from:oh-my-zsh
zplug "plugins/svn", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
#zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/gem", from:oh-my-zsh
zplug "plugins/rbenv", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
#zplug "themes/gnzh", from:oh-my-zsh, as:theme

#zplug "plugins/git",    from:oh-my-zsh, if:"which git"
#zplug "plugins/go",     from:oh-my-zsh, if:"which go"
#zplug "plugins/golang", from:oh-my-zsh, if:"which go"
#zplug "plugins/nmap",   from:oh-my-zsh, if:"which nmap"
#zplug "plugins/sudo",   from:oh-my-zsh, if:"which sudo"
#zplug "plugins/tmux",   from:oh-my-zsh, if:"which tmux"

#zplug "plugins/bundler", from:oh-my-zsh, if:"which bundle"
#zplug "plugins/colored-man-pages", from:oh-my-zsh
#zplug "plugins/extract", from:oh-my-zsh
#zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
#zplug "plugins/git", from:oh-my-zsh, if:"which git"
#zplug "plugins/globalias", from:oh-my-zsh
#zplug "plugins/gpg-agent", from:oh-my-zsh, if:"which gpg-agent"
#zplug "plugins/httpie", from:oh-my-zsh, if:"which httpie"
#zplug "plugins/nanoc", from:oh-my-zsh, if:"which nanoc"
#zplug "plugins/vi-mode", from:oh-my-zsh

# plugins

# Enhanced cd
zplug "b4b4r07/enhancd", use:enhancd.sh

# Bookmarks and jump
#zplug "jocelynmallon/zshmarks"

# Enhanced dir list with git features
zplug "supercrabtree/k"

# Tips for aliases
#zplug "djui/alias-tips"

# Auto-close and delete matching delimiters
zplug "hlissner/zsh-autopair", defer:2

# Docker completion
zplug "felixr/docker-zsh-completion"

# Jump back to parent directory
zplug "tarrasch/zsh-bd"

# Simple zsh calculator
zplug "arzzen/calc.plugin.zsh"

# Directory colors
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

# Load theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Theme setup

# Easily switch primary foreground/background colors
DEFAULT_FOREGROUND=006 DEFAULT_BACKGROUND=235
DEFAULT_COLOR=$DEFAULT_FOREGROUND

# powerlevel9k prompt theme
#DEFAULT_USER=$USER

#POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_right"

prompt_zsh_showStatus () {
    local color='%F{white}'
  state=`osascript -e 'tell application "Spotify" to player state as string'`;
  if [ $state = "playing" ]; then
    artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
    track=`osascript -e 'tell application "Spotify" to name of current track as string'`;

      echo -n "%{$color%}  $artist - $track " ; 

  fi
}

prompt_zsh_battery_level() {
    percentage=`pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';' | grep -oe '\([0-9.]*\)'`
    local color='%F{red}'
    local symbol="\uf00d"
if [ "$(bc <<< "scale=2 ; $percentage<25")" = '1' ]
    then symbol="\uf244" ; color='%F{red}' ;
        #Less than 25
        fi  
if [ "$(bc <<< "scale=2 ; $percentage>=25")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<50")" = '1' ]
    then symbol='\uf243' ; color='%F{red}' ;
    #25%
    fi
if [ "$(bc <<< "scale=2 ; $percentage>=50")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<75")" = '1' ]  
    then symbol="\uf242" ; color='%F{yellow}' ;
     #50%
     fi
if [ "$(bc <<< "scale=2 ; $percentage>=75")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<100")" = '1' ]
    then symbol="\uf241" ; color='%F{blue}' ;
        #75%
        fi  
if [ "$(bc <<< "scale=2 ; $percentage>99")" = '1' ]
    then symbol="\uf240" ; color='%F{green}' ;
        #100%
        fi
pmset -g batt | grep "discharging" >& /dev/null
if [ $? -eq 0 ]; then
    true;
else ;
   color='%F{green}' ;
fi
echo -n "%{$color%}$symbol " 
}

zsh_internet_signal(){
  #source on quality levels - http://www.wireless-nets.com/resources/tutorials/define_SNR_values.html
  #source on signal levels  - http://www.speedguide.net/faq/how-to-read-rssisignal-and-snrnoise-ratings-440
    local signal=$(airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g')
  local noise=$(airport -I | grep agrCtlNoise | awk '{print $2}' | sed 's/-//g')
  local SNR=$(bc <<<"scale=2; $signal / $noise")

  local net=$(curl -D- -o /dev/null -s http://www.google.com | grep HTTP/1.1 | awk '{print $2}')
  local color='%F{yellow}'
  local symbol="\uf197"

  # Excellent Signal (5 bars)
  if [[ ! -z "${signal// }" ]] && [[ $SNR -gt .40 ]] ; 
    then color='%F{black}' ; symbol="\uf1eb" ;
  fi

  # Good Signal (3-4 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .40 ]] && [[ $SNR -gt .25 ]] ; 
    then color='%F{green}' ; symbol="\uf1eb" ;
  fi

  # Low Signal (2 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .25 ]] && [[ $SNR -gt .15 ]] ; 
    then color='%F{yellow}' ; symbol="\uf1eb" ;
  fi

  # Very Low Signal (1 bar)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .15 ]] && [[ $SNR -gt .10 ]] ; 
    then color='%F{red}' ; symbol="\uf1eb" ;
  fi

  # No Signal - No Internet
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .10 ]] ; 
    # then color='%F{red}' ; symbol="\uf011";
    then color='%F{red}' ; symbol="\uf204";
  fi

  if [[ -z "${signal// }" ]] && [[ "$net" -ne 200 ]] ; 
    # then color='%F{red}' ; symbol="\uf011";
    then color='%F{red}' ; symbol="\uf204" ;
  fi

  # Ethernet Connection (no wifi, hardline)
  if [[ -z "${signal// }" ]] && [[ "$net" -eq 200 ]] ; 
    then color='%F{blue}' ; symbol="\uf197" ;
  fi

  echo -n "%{$color%}$symbol " # \f1eb is wifi bars
}

#POWERLEVEL9K_MODE='nerdfont-complete'

# OS segment
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

# Dirs
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# Context
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{cyan}%n%f"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'

# Status
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

# Double-Lined Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}╭%F{cyan}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "

# battery
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON=`prompt_zsh_battery_level `

# Time
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %m.%d.%y}"
POWERLEVEL9K_TIME_BACKGROUND='white'

# network
POWERLEVEL9K_NETWORK_ICON=`zsh_internet_signal`
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status zsh_showStatus background_jobs virtualenv rbenv rvm battery ip time)

# command_execution_time
# ram 

# =============================================================================
#                                   Options
# =============================================================================

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]];
then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

# Watching other users
#WATCHFMT="%n %a %l from %m at %t."
watch=(notme)         # Report login/logout events for everybody except ourself.
#watch=(all)         # Report login/logout events for everybody except ourself.
LOGCHECK=60           # Time (seconds) between checks for login/logout activity.
REPORTTIME=5          # Display usage statistics for commands running > 5 sec.
#WORDCHARS="\"*?_-.[]~=/&;!#$%^(){}<>\""
#WORDCHARS="\"*?_-[]~&;!#$%^(){}<>\""
WORDCHARS='`~!@#$%^&*()-_=+[{]}\|;:",<.>/?'"'"

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.

# Changing directories
#setopt auto_pushd
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with "-".

setopt extended_glob

# =============================================================================
#                                   Aliases
# =============================================================================

# In the definitions below, you will see use of function definitions instead of
# aliases for some cases. We use this method to avoid expansion of the alias in
# combination with the globalias plugin.

# Load aliases
[ -f ~/.aliases ] && . ~/.aliases

# Directory coloring
if [[ $OSTYPE = (darwin|freebsd)* ]]; then
    export CLICOLOR="YES" # Equivalent to passing -G to ls.
    export LSCOLORS="exgxdHdHcxaHaHhBhDeaec"

#    [ -d "/opt/local/bin" ] && export PATH="/opt/local/bin:$PATH"

    # Prefer GNU version, since it respects dircolors.
    if which gls &>/dev/null; then
        alias ls='() { $(whence -p gls) -Ctr --file-type --color=auto $@ }'
    else
        alias ls='() { $(whence -p ls) -CFtr $@ }'
    fi
else
    alias ls='() { $(whence -p ls) -Ctr --file-type --color=auto $@ }'
fi

# Generic command adaptations
alias grep='() { $(whence -p grep) --color=auto $@ }'
alias egrep='() { $(whence -p egrep) --color=auto $@ }'

# Custom helper aliases
alias ccat='highlight -O ansi'
alias rm='rm -v'

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# =============================================================================
#                                Key Bindings
# =============================================================================

# Common CTRL bindings.
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward

# Do not require a space when attempting to tab-complete.
bindkey "^i" expand-or-complete-prefix

# Fixes for alt-backspace and arrows keys
bindkey '^[^?' backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

## Emulate tcsh's backward-delete-word
#tcsh-backward-kill-word () {
#    local WORDCHARS="${WORDCHARS:s#/#}"
#    zle backward-kill-word
#}
#zle -N tcsh-backward-kill-word

# https://github.com/sickill/dotfiles/blob/master/.zsh.d/key-bindings.zsh
tcsh-backward-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle emacs-backward-word
}
zle -N tcsh-backward-word
bindkey '\e[1;3D' tcsh-backward-word
bindkey '\e^[[D' tcsh-backward-word # tmux

tcsh-forward-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle emacs-forward-word
}
zle -N tcsh-forward-word
bindkey '\e[1;3C' tcsh-forward-word
bindkey '^[^[[C' tcsh-forward-word # tmux

tcsh-backward-delete-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle backward-delete-word
}
zle -N tcsh-backward-delete-word
bindkey "^[^?" tcsh-backward-delete-word # urxvt

# =============================================================================
#                                 Completions
# =============================================================================

zstyle ':completion:*' rehash true
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''

# case-insensitive (all), partial-word and then substring completion
zstyle ":completion:*" matcher-list \
  "m:{a-zA-Z}={A-Za-z}" \
  "r:|[._-]=* r:|=*" \
  "l:|=* r:|=*"

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

# =============================================================================
#                                   Startup
# =============================================================================

# Load SSH and GPG agents via keychain.
setup_agents() {
  [[ $UID -eq 0 ]] && return

  if which keychain &> /dev/null; then
    local -a ssh_keys gpg_keys
    for i in ~/.ssh/**/*pub; do test -f "$i(.N:r)" && ssh_keys+=("$i(.N:r)"); done
    gpg_keys=$(gpg -K --with-colons 2>/dev/null | awk -F : '$1 == "sec" { print $5 }')
    if (( $#ssh_keys > 0 )) || (( $#gpg_keys > 0 )); then
      alias run_agents='() { $(whence -p keychain) --quiet --eval --inherit any-once --agents ssh,gpg $ssh_keys ${(f)gpg_keys} }'
      #[[ -t ${fd:-0} || -p /dev/stdin ]] && eval `run_agents`
      unalias run_agents
    fi
  fi
}

setup_agents
unfunction setup_agents

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# dircolors
if zplug check "seebi/dircolors-solarized"; then
  if which gdircolors &> /dev/null; then
    alias dircolors='() { $(whence -p gdircolors) }'
  fi
  if which dircolors &> /dev/null; then
    scheme="dircolors.256dark"
    eval $(dircolors ~/.zplug/repos/seebi/dircolors-solarized/$scheme)
  fi
fi

# history
if zplug check "zsh-users/zsh-history-substring-search"; then
    zmodload zsh/terminfo
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down
    bindkey "^[[1;5A" history-substring-search-up
    bindkey "^[[1;5B" history-substring-search-down
fi

# highlighting
if zplug check "zsh-users/zsh-syntax-highlighting"; then
    #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
    ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

    typeset -A ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_STYLES[cursor]='bg=yellow'
    ZSH_HIGHLIGHT_STYLES[globbing]='none'
    ZSH_HIGHLIGHT_STYLES[path]='fg=white'
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=grey'
    ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[command]='fg=green'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
fi

# =============================================================================
#                                User-Config
# =============================================================================

export GOPATH=$HOME/go

# PIP path
PIP_PATH="/usr/local/Cellar/python/2.7.12/Frameworks/Python.framework/Versions/2.7/bin"

# Go Path
GO_PATH="/usr/local/go/bin"

# Ruby path
RUBY_PATH="/usr/local/Cellar/ruby/2.3.3/bin"

# Racket path
RACKET_PATH="/Applications/Racketv6-5/bin"

# Rust path
RUST_PATH="$HOME/.cargo/bin"

# Latex Path
LATEX_PATH="/Library/TeX/texbin"

# AndroidSDK Path
ANDROID_PATH="/usr/bin/AndroidSDK/platform-tools"

# MacGPG Path
MACGPG_PATH="/usr/local/MacGPG2/bin"

MAC_PATH="$LATEX_PATH:$RUST_PATH:$PIP_PATH:$RUBY_PATH:$GO_PATH:$RACKET_PATH:$MACGPG_PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/opt/local/sbin"
NIX_PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# Source local zsh customizations.
[[ -f ~/.zsh_rclocal ]] && source ~/.zsh_rclocal

# Source functions and aliases.
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

#autoload -Uz compinit
#compinit

#ZLE_RPROMPT_INDENT=0

# vim: ft=zsh
