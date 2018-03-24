export ZSH=/home/quinn/.oh-my-zsh

ZSH_THEME="cordial"

export UPDATE_ZSH_DAYS=7

plugins=(git npm sudo man)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# edit this to get weather at startup (because I never go outside)
LOCATION="San Jose, CA"

alias diskspace="du -S | sort -n -r | less"

alias more="less"

definition() {
    dict $1 | less -F
}

alias py="python3"
alias py2="python"
alias py3="python3"

alias sagi="sudo apt-get -y install"
sagr() {
    sudo apt-get -y remove $1 && sudo apt-get -y autoremove
}
acs() {
    data=$(apt-cache search $1)
    echo $data | less
}

#fix spelling
alias pgreg="pgrep"
alias sl="ls"

alias mkdir="mkdir -pv" #make parents if needed, and display all folders made

alias rm="rm --preserve-root"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"

alias mips="java -jar ~/.bin/Mars4_5.jar nc"
alias mipsUI="java -jar ~/.bin/Mars4_5.jar"

alias valgrind="valgrind --tool=memcheck --leak-check=full"

# add "homemade" scripts
export PATH=$HOME/.bin:$PATH

alias up='. up' #if i don't source it i don't move
alias mkcd='. mkcd'

alias v='vim'

#add node
export PATH=~/.npm-global/bin:$PATH
PATH=~/.cabal/bin:$PATH
PATH=~/.local/bin:$PATH

export NVM_DIR="/home/quinn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

greet
echo

CURRENT_LOC="Hello world!"
test_func() {
    echo $CURRENT_LOC
    TMP=$CURRENT_LOC
    echo $TMP
}

__weather_() {
    wget -q --spider http://google.com
    if [ $? -eq 0 ]; then
        WEATHER=$(ansiweather -a false -d true -l $LOCATION)
        echo $?
        echo $WEATHER
        WEATHER=$(echo $WEATHER | tr "-" "\n")
        count=0
        echo $LOCATION
        while IFS='\n' read -r ARR; do
            for i in "${ARR[@]}"; do
                # change the output of temperature and skip pressure
                if [ $count -eq 0 ]; then
                    echo "Temperature => "$(echo $i | awk '{ print $(NF-2)$(NF-1)" "$NF }')
                elif [ $count -ne 3 ]; then
                    echo $i
                fi
                count=$(expr $count + 1)
            done
        done <<< $(echo $WEATHER | sed -e 's/^[[:space:]]*//')
    fi
}

__storage_() {
    df -m ~ | tail -n 1 | awk '{ print "Storage: "$5" full\n"$3" MB used\n"$4" MB free\n"$3+$4" MB total" }'
}
pr -tm <(__storage_) <(__weather_)

#nietzsche is a custom fortune file
cowsay $(fortune nietzsche)


update() {
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y dist-upgrade 
    sudo apt-get -y autoremove
    sudo apt-get -y autoclean
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
