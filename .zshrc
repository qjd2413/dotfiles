export ZSH=/home/quinn/.oh-my-zsh

ZSH_THEME="cordial"

export UPDATE_ZSH_DAYS=7

plugins=(git npm sudo)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

alias diskspace="du -S | sort -n -r | more"
alias py="python3"
alias py2="python"
alias py3="python3"

alias agi="sudo apt-get install"
alias agr="sudo apt-get remove"
alias agar="sudo apt-get autoremove"
alias acs="apt-cache search"

alias pgreg="pgrep"
alias mkdir="mkdir -pv"

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
pr -tm <(cal) <(__weather_)

#echo "Your fortune: "
#fortune -s
#echo
__fortune_() {
    LEN=0
    FTN=($(fortune -s))
    for i in $FTN; do
        LEN=$(expr $LEN + ${#i})
        if [ $LEN -ge 35 ]; then
            echo -n "\n$i "
            echo -n "\n$LEN " >> lengths
            LEN=$(expr ${#i} + 1)
        else
            echo -n "$i "
            echo -n "$LEN " >> lengths
            LEN=$(expr $LEN + 1)
        fi
    done
    if [ $LEN -lt 35 ]; then
        echo
    fi
}

__storage_() {
    df -m ~ | tail -n 1 | awk '{ print "Storage: "$5" full | "$3" MB used | "$4" MB free | "$3+$4" MB total" }'
}
__storage_
echo

cowsay $(fortune nietzsche)