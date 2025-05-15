#!/bin/bash

prefix='/home/oogway/uni/'
declare -A materie
materie[micro]='microcontrollori 💡' 
materie[prog_proc]='programmazione_procedurale 🇨' 
materie[prog_func]='programmazione_funzionale λ'
materie[automi]='automi_e_linguaggi 🏯'
materie[logica]='logica 🧠'
materie[fds]='sicurezza 🔒'

emojis=''
html_index=''
li='<a href="docs/%s.pdf" target="_blank" rel="noopener noreferrer"><li>%s</li></a>'

for materia in "${!materie[@]}"
do  
    # echo $materia
    IFS=' ' read -ra data <<< "${materie[$materia]}"
    # echo ${data[1]}
    # exit
    cd "$prefix$materia" 
    # pwd
    # exit
    make docs &> /dev/null
    cd "${prefix}notes"
    cp "${prefix}${materia}/notes.pdf" "docs/$materia.pdf"
    li_iter="$(printf "${li}\n" "$materia" "${data[0]}")"
    html_index="${html_index}$li_iter"
    emojis="${emojis}${data[1]} "
    # echo $li_iter
    # exit
    
done

# echo $html_index
# echo $emojis
# exit
# printf "$html_index" "\n"
# printf "$emojis" ""

template="$(cat index-template.html)"
printf "$template" "$emojis" "$html_index" > index.html
# echo template

cd ${prefix}notes
git add .
git commit -m "$(date)" 
git push