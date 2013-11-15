# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source local definitions
. ~/.bashrc.local

export EDITOR=vim

# Use fish instead
/usr/bin/fish
exit 0

# Up-directory aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Shortcut for mkdir + cd
function mkcd { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }


# Long session/total history files
export HISTSIZE=3000
export HISTFILESIZE=50000

# Set format and reduce clutter
export HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTIGNORE='&:exit:fc:history:ht'

# Ignore duplicates and lines starting with space
export HISTCONTROL=ignoredups:ignorespace

# Append to history (instead of overwriting)
shopt -s histappend

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

