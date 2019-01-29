# Color Schemes
D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'

hg_ps1() {
    hg prompt "{${D} on ${PINK}{branch}}{${D} at ${ORANGE}{bookmark}}{${GREEN}{status}}" 2> /dev/null
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\n${PINK}\u ${D}at ${ORANGE}\h ${D}in ${GREEN}\w$(hg_ps1)$(parse_git_branch) ${D}\n$ '
export CLICOLOR=1
export TERM=xterm-256color

# Android SDK
export PATH=${PATH}:/Users/charlesbarros/Library/Android/sdk/platform-tools
export PATH=${PATH}:/Users/charlesbarros/Library/Android/sdk/tools
export PATH=${PATH}:/Users/charlesbarros/Documents/Shell

unitylogcat() {
	if [ "$#" -eq 1 ]; then
		printf "> Unity Editor Log Cat - Tag: ["$1"]\n\n"
		tail -f  ~/Library/Logs/Unity/Editor.log | grep --line-buffered '\['$0'\]' | ~/coloredUnityLogcat.py
	elif [ "$#" -eq 2 ]; then
		printf "> Unity Editor Log Cat - Grep: "$2"\n\n"
		tail -f  ~/Library/Logs/Unity/Editor.log | grep $2
	else
		printf "> Unity Editor Log Cat\n\n"
		tail -f  ~/Library/Logs/Unity/Editor.log | ~/coloredUnityLogcat.py
	fi
}
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias adbpidcat="adb logcat -v brief | pidcat"