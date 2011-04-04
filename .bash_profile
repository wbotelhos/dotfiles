# ENVIRONMENT
	export TOMCAT_HOME=/Users/${USER}/Development/apache-tomcat-6.0.29
	export ANT_HOME=/Users/${USER}/Development/apache-ant-1.8.2
	export MYSQL_HOME=/usr/local/mysql-5.1.42-osx10.5-x86_64

	# WINE
	export EP_LIB=/Users/${USER}/workspace/wine/env/ep6lib
	export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home

	export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$MYSQL_HOME/bin

# ALIAS
	alias pstom='ps aux | grep tomcat'
	alias cls='clear'
	alias ..='cd ..'
	alias la='ls -lah'
	alias clstom='rm ${TOMCAT_HOME}/logs/*.log'
	alias shuttom='${TOMCAT_HOME}/bin/shutdown.sh'
	alias starttom='${TOMCAT_HOME}/bin/startup.sh'

	# GIT
	alias gst='git status'
	
	# MKV
	alias mkv='~/Development/mkvdts2ac3.sh -f -i -n -d -c English --new ~/mkv.mkv'

	# WINE
	alias windex='cp /Users/botelho/Programmer/Wine/resources/* /Users/botelho/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/com.elasticpath.search/WEB-INF/conf/resources'

# RUBY
	source ~/.rvm/scripts/rvm

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
		export PS1="${WHITE}\u${RED}@${PURPLE}\h ${CYAN}\w ${WHITE}(`~/.rvm/bin/rvm-prompt v`) \$(parse_git_branch) ${YELLOW}$ \[\e[m\]\[\e[m\]"
	}; prompt