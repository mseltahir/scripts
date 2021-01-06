alias c='clear'
alias e='exit'
alias s='subl'
alias g='geany'
alias ealiases='s ~/.bash_aliases'
alias saliases='source ~/.bash_aliases'
alias vimrc='vim ~/.vimrc'

alias cm='f(){ cp ~/code/temp.cpp $1.cpp && subl $1.cpp; unset -f f; }; f'
alias vm='f(){ cp ~/code/temp.cpp $1.cpp && vim $1.cpp; unset -f f; }; f'
alias gm='f(){ cp ~/code/temp.cpp $1.cpp && geany $1.cpp; unset -f f; }; f'
alias comp='f(){ g++ -std=c++17 -O2 -W $1 -o ${1//.cpp}; unset -f f; }; f'

alias cparse='~/scripts/cparser.py'
alias run='~/scripts/run_samples.sh'
alias ain='~/scripts/add_test_in.sh'
alias aout='~/scripts/add_test_out.sh'
alias eclear='~/scripts/clear_executables.sh'
