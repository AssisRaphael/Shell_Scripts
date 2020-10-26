#!/bin/bash

:'
Recebe três números inteiros pela entrada padrão (e não via argumentos em linha de comando) e mostre qual o maior deles. 
'

echo "Primeiro número: "
read numero1

echo "Segundo número: "
read numero2

echo "Terceiro número: "
read numero3

if [ $numero1 -gt $numero2 ]; then
	if [ $numero1 -gt $numero3 ]; then
    	echo "O maior número é $numero1"
	fi
elif [ $numero2 -gt $numero3 ]
then
    echo "O maior número é $numero2"
else
    echo "O maior número é $numero3"
fi
