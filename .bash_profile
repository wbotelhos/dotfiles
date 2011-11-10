# ENVIRONMENT
	export ANT_HOME=/Users/${USER}/Development/apache-ant-1.8.2
	export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home
#	export JAVA_HOME=~/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
	export JBOSS_HOME=~/Users/${USER}/Development/jboss-5.1.0.GA
	export JETTY_HOME=/Users/${USER}/Development/jetty-6.1.3
	export M2_HOME=/Users/${USER}/Development/apache-maven-3.0.3
	export MYSQL_HOME=/usr/local/mysql-5.1.42-osx10.5-x86_64
	export TOMCAT_HOME=/Users/${USER}/Development/apache-tomcat-6.0.32

	export REPO=~/.m2/repository

	export PATH=$PATH:$ANT_HOME/bin:$JAVA_HOME/bin:$JBOSS_HOME/bin:$JAVA_HOME/bin:$M2_HOME/bin:$MYSQL_HOME/bin:$TOMCAT_HOME/bin

# ALIAS
	alias ..='cd ..'
	alias cls='clear'
	alias clstom='rm ${TOMCAT_HOME}/logs/*.log'
	alias clsbash='echo "" > .bash_history'
	alias la='ls -lah'
	alias pstom='ps aux | grep tomcat'
	alias shuttom='${TOMCAT_HOME}/bin/shutdown.sh'
	alias starttom='${TOMCAT_HOME}/bin/startup.sh'
	alias startmy='sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop'
	alias startmy='sudo /Library/StartupItems/MySQLCOM/MySQLCOM start'
	alias restartmy='sudo /Library/StartupItems/MySQLCOM/MySQLCOM restart'

	# GIT
	alias gst='git status'
	alias gpl='git pull origin master'
	alias gps='git push origin master'

	# MKV
	alias mkv='~/Development/mkvdts2ac3.sh -f -i -n -d -c English --new ~/mkv.mkv'

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
