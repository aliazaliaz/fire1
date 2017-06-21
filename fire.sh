#!/usr/bin/env bash

fire=$(cd $(dirname $0); pwd)
cd $fire

install() {
	    cd tg
		sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 -y c++-4.7 -y
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
		sudo apt-get install screen -y
		sudo apt-get install tmux -y
		sudo apt-get install libstdc++6 -y
		sudo apt-get install lua-lgi -y
		sudo apt-get install libnotify-dev -y
		wget https://valtman.name/files/telegram-cli-1222
		mv telegram-cli-1222 tgcli
		chmod +x tgcli
		cd ..
		chmod +x bot
		chmod +x tg
		chmod +x autoenergy.sh
}

function print_logo() {
	green "         .sSSSSs.    SSSSS .sSSSSSSSs. .sSSSSs.   "
	green "         S SSSSSSSs. S SSS S SSS SSSSS S SSSSSSSs."
	green "         S  SS SSSS' S  SS S  SS SSSS' S  SS SSSS'"
	green "         S..SS       S..SS S..SSsSSSa. S..SS      "
	green "         S:::SSSS    S:::S S:::S SSSSS S:::SSSS   "
	green "         S;;;S       S;;;S S;;;S SSSSS S;;;S      "
	green "         S%%%S       S%%%S S%%%S SSSSS S%%%S SSSSS"
	green "         SSSSS       SSSSS SSSSS SSSSS SSSSSsSS;:'"
	echo -e "\n\e[0m"
}

function logo_play() {
    declare -A txtlogo
    seconds="0.010"
    txtlogo[1]="   .sSSSSs.    SSSSS .sSSSSSSSs. .sSSSSs.   "
    txtlogo[2]="   S SSSSSSSs. S SSS S SSS SSSSS S SSSSSSSs."
    txtlogo[3]="   S  SS SSSS' S  SS S  SS SSSS' S  SS SSSS'"
    txtlogo[4]="   S..SS       S..SS S..SSsSSSa. S..SS      "
	txtlogo[5]="   S:::SSSS    S:::S S:::S SSSSS S:::SSSS   "
	txtlogo[6]="   S%%%S       S%%%S S%%%S SSSSS S%%%S SSSSS"
	txtlogo[7]="   S%%%S       S%%%S S%%%S SSSSS S%%%S SSSSS"
	txtlogo[8]="   SSSSS       SSSSS SSSSS SSSSS SSSSSsSS;:'"
    printf "\e[31m\t"
    for i in ${!txtlogo[@]}; do
        for x in `seq 0 ${#txtlogo[$i]}`; do
            printf "${txtlogo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
	echo -e "\e[0m"
}

function energy_team() {
	echo -e "\e[0m"
	green "     >>>>                       edir 1 source                                               "
	green "     >>>>                       beyond                                                      "
	white "     >>>>                       edited by aliaz003                                          "
	white "     >>>>                       @fire021tm                                                  "
	red   "     >>>>                       @fire021tm                                                  "
	red   "     >>>>                       @fire021tm                                                  "
	echo -e "\e[0m"
}

red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}
update() {
	git pull
}

if [ "$1" = "install" ]; then
	print_logo
	energy_team
	logo_play
	install
  else
if [ ! -f ./tg/tgcli ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit 1
 fi
	print_logo
	energy_team
	logo_play
   #sudo service redis-server restart
   ./tg/tgcli -s ./bot/bot.lua -l 1 -E $@
   #./tg/tgcli -s ./bot/bot.lua $@
fi
