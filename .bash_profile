# ALIAS
	alias pstom='ps aux | grep tomcat'
	alias celar='clear' # fail ^^
	alias ..='cd ..'
	alias la='ls -lah'

	# GIT
		alias gst='git status'


# ENVIRONMENT
	export TOMCAT_HOME=/Applications/apache-tomcat-6.0.29
	export ANT_HOME=/Applications/apache-ant-1.7.1

	export PATH=$PATH:$ANT_HOME/bin

	# WINE
		export EP_LIB=/Users/${USER}/workspace/wine/env/ep6lib
		export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home

		export PATH=$PATH:$JAVA_HOME/bin


# COLOR
	export GREP_OPTIONS='--color=auto'
	export GREP_COLOR='1;37'

	export CLICOLOR=1
	export LSCOLORS=ExFxCxDxBxegedabagacad

	parse_git_branch() {
	  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
	}
 
	# 30m - Black | 31m - Red | 32m - Green | 33m - Yellow | 34m - Blue | 35m - Purple | 36m - Cyan | 37m - White | green others...
	# 0 - Normal | 1 - Bold | 2 -
	function prompt {
		local BLACK="\[\033[0;30m\]"
		local RED="\[\033[0;31m\]"
		local GREEN="\[\033[0;32m\]"
		local YELLOW="\[\033[0;33m\]"
		local BLUE="\[\033[0;34m\]"
		local PURPLE="\[\033[0;35m\]"
		local CYAN="\[\033[0;36m\]"
		local WHITE="\[\033[0;37m\]"
		local WHITEBOLD="\[\033[1;37m\]"
		export PS1="${WHITE}\u${RED}@${PURPLE}\h ${CYAN}\w ${WHITE}\$(parse_git_branch) ${YELLOW}$ \[\e[m\]\[\e[m\]"
	}; prompt