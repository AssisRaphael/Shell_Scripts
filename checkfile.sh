#!/bin/bash

:'
recebe um arquivo como argumento em linha de comando e verifica se existe ou não. Caso exista, verifique se é um arquivo, um diretório ou desconhecido mostrando quais as permissões que o usuário atual (não do dono do arquivo) possui sobre ele. Caso não exista, imprima que é inválido. 
'

arquivo=$1;

# arquivo/diretório não existe
if ! [ -e "$arquivo" ]; then
	echo "Usar: ./checkfile [Arquivo]";
	exit 1;
fi

# arquivo/diretório existe
if [ -d "$arquivo" ]; 
then
	echo -n "$arquivo: diretório (";
elif [ -f "$arquivo" ] 
then
	echo -n "$arquivo: arquivo (";
else
	echo -n "$arquivo: desconhecido (";
fi

if [ -r "$arquivo" ]; then 
		echo -n "r";
	else
		echo -n "-";
	fi
	if [ -w "$arquivo" ]; then 
		echo -n "w";
	else
		echo -n "-";
	fi
	if [ -x "$arquivo" ]; then 
		echo -n "x";
	else
		echo -n "-";
	fi
    echo ")";