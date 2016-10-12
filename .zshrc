export ZSH=/home/quinn/.oh-my-zsh

ZSH_THEME="cordial"

export UPDATE_ZSH_DAYS=7

plugins=(git npm sudo)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

alias diskspace="du -S | sort -n -r | less"

alias more="less"

definition() {
    dict $1 | less -F
}

alias py="python3"
alias py2="python"
alias py3="python3"

alias inst="sudo apt-get install"
alias rem="sudo apt-get remove"
alias autorem="sudo apt-get autoremove"
search() {
    data=$(apt-cache search $1)
    echo $data | less -F
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

# add "homemade" scripts
export PATH=$HOME/.bin:$PATH

alias up='. up' #if i don't source it i don't move
alias mkcd='. mkcd'

#add node
export PATH=~/.npm-global/bin:$PATH
PATH=~/.cabal/bin:$PATH

export NVM_DIR="/home/quinn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

greet
echo

__weather_() {
    wget -q --spider http://google.com
    if [ $? -eq 0 ]; then
        LOC="Rochester, NY"
        WEATHER=$(ansiweather -a false -d true -l "Rochester, NY")
        WEATHER=$(echo $WEATHER | tr "-" "\n")
        FL=1
        echo $LOC
        while IFS='\n' read -r ARR; do
            for i in "${ARR[@]}"; do
                if [ $FL -eq 1 ]; then
                    FL=0
                    echo "Temperature => "$(echo $i | awk '{ print $6$7" "$8 }')
                else
                    echo $i
                fi
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
    sudo apt-get upgrade && sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean
}
