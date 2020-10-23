#!/bin/bash

# Este programa lê todos os arquivos .c do diretório de trabalho
# E lista quantos comandos if, else, for, while e switch tem em cada um deles

#Captura o comando ctrl+c enviado pelo SO e invoca o método interrupcao()
trap interrupcao INT

function interrupcao() { # (1)
        echo "Interrupção detectada - terminando programa ..."
        exit 404
}

#Variável que armazena o número de arquivos .c no diretório atual
num_progs=($(ls *.c 2> /tmp/erros.txt | wc -l));

#Vetor que armazena o nome dos arquivos .c no diretório atual
progs=($(ls *.c 2> /tmp/erros.txt));

echo -e "\n\nArquivos C: \n"

if ls *.c &> /tmp/erros.txt; then

    printf '%15s %8s %8s %8s %8s %8s %8s\n' 'nome' 'fors' 'whiles' 'ifs' 'elses' 'switches' 'prints'

    for i in `seq 0 $(($num_progs - 1))`; do

        echo "_______________________________________________________________________________";

        a1=($(grep -i for ${progs[$i]} | wc -l)); #conta a quantidade de fors

        a2=($(grep -i while ${progs[$i]} | wc -l)); #conta a quantidade de whiles

        a3=($(grep -i if ${progs[$i]} | wc -l)); #conta a quantidade de ifs

        a4=($(grep -i else ${progs[$i]} | wc -l)); #conta a quantidade de elses

        a5=($(grep -i switch ${progs[$i]} | wc -l)); #conta a quantidade de switches

        a6=($(grep -i printf ${progs[$i]} | wc -l)); #conta a quantidade de printfs

        printf '%15s %8s %8s %8s %8s %8s %8s\n' "${progs[$i]}" "$a1" "$a2" "$a3" "$a4" "$a5" "$a6"

    done
else
    echo " Nenhum arquivo .c encontrado! ";
fi

echo -e "\n\n"

exit 0
