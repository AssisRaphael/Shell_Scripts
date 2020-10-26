#!/bin/bash

:'
O comando expr é capaz de realizar cálculos com expressões aritméticas inteiras. 
Reescreva um programa similar em shell script para calcular uma expressão com apenas 
um operador (+, -, x, /) com dois números em ponto flutuante e imprima o resultado em 
ponto flutuante. Você deve usar a estrutura case como controle de fluxo condicional. 
O programa deve ler os dois números e o operador via parâmetros em linha de comando. 
Caso não sejam especificados os três parâmetros, deve-se mostrar uma mensagem de ajuda. 
Se o operador não for um dos quatro suportados, deve-se mostrar uma mensagem de erro. 
Dica: use o comando bc (basic calculator) para fazer as operações em ponto-flutuante.

Exemplo de uso do shell script:

$ ./calc
Usar: ./calc [Número] [Operador] [Número]
$ ./calc 22 / 7
3.14285714285714285714
$ ./calc 12 - 7.2
4.8
$ ./calc 5 % 4
%: operação inválida

'

a=$1;
op=$2;
b=$3;

if [ $# -lt 3 ]; then
    	echo "Usar: ./calc [Número] [Operador] [Número]";
    	exit 2;
fi

case "$op" in
	'+')
		echo "$a + $b" | bc -l;
		;;
	'-')
		echo "$a - $b" | bc -l;
		;;
	'x'|'X')
		echo "$a * $b" | bc -l;
		;;
	'/')
		echo "$a / $b" | bc -l;
		;;
	*)
		echo "$op: operação inválida";
		exit 1;
		;;
esac
