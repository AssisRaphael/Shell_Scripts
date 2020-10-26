#!/bin/bash

:'
Escrever um shell script para cumprimentar um usuário com "Bom dia", "Boa tarde" ou "Boa noite" dependendo do horário do sistema. A saudação deve incluir o nome completo do usuário atualmente logado. Dica: use o comando whoami para obter o usuário atual e depois consulte o arquivo /etc/passwd na quinta coluna para obter o seu nome completo. As horas do dia são divididas da seguinte maneira:

• Dia: até 12:00
• Tarde: a partir de 12:00 e até 18:00
• Noite: a partir das 18:00
'

hora=($(date | awk '{print $4}'));

user=($(whoami));

usuario=($(cat /etc/passwd | grep "$user" | awk -F: '{print $5}'));

if [ $hora "<" "12:00" ]; then
	echo -n "Bom dia ";
elif [ $hora ">" "12:00" ]; then
	if [ $hora "<" "18:00" ]; then
    	echo -n "Boa tarde ";
	fi
else
    echo -n "Boa noite ";
fi

echo "$usuario, seja bem vindo.";