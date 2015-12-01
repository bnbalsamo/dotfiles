#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [[ -d ${HOME}/.loca./bin && ${PATH} != *${HOME}/.local/bin* ]] ; then
        export PATH=${HOME}/.local/bin:"${PATH}:"
fi

PS1='[\u@\h \W]\$ '

#Declarations
export EDITOR="/usr/bin/vim"
export IMAGEVIEWER="/usr/bin/viewnior"
export AUDIOPLAYER="/usr/bin/vlc"

#Aliases
alias ls='ls -G'
alias grep='grep --color=auto'
alias playipod="rec -r 44100 -t wav -q - | play -t wav -q -"
alias whatsmyip='curl ifconfig.me'
alias define=sdcv
alias startSamba="sudo systemctl start smbd.service nmbd.service"
alias stopSamba="sudo systemctl stop smbd.service nmbd.service"

#Functions

function pdfify {
    nohup unoconv -f pdf $1 >/dev/null 2>/dev/null
}
function encrypt {
    gpg --symmetric --cipher-algo aes256 $1 1>&2 2>/dev/null
}
function decrypt {
    gpg -d $1 > `echo $1 | rev | cut -c 5- | rev`
}
function decryptClipboard {
    xclip -o | gpg -d
}
function encryptClipboard {
    echo -n "Recepient: "
    read recepient
    xclip -o | gpg -ear $recepient | xclip -i
    echo -n "Clipboard now a GPG encrypted message for "
    echo $recepient
}
function encryptMail {
    #Check for the mailx command, if it doesn't exist exit returning error code one.
    command -v mailx >/dev/null 2>&1 || { echo -e >&2 "This program requires mailx but it's not installed.\nAborting."; return 1; }
    #See if our mail.rc file exists. If not print a sample and exit returning error code 1. This DOES NOT cover all cases, and if you, for example, change the location of the mail.rc file, comment out or alter accordingly the next three lines.
    if [[ ! -e /etc/mail.rc ]]; then
        echo -e "\nThis program requires your mail command have a valid configuration file in /etc/mail.rc.\n This file should probably look like this with your own username and password substituted:\nset sendmail="/usr/bin/mailx"\nset smtp=smtp.gmail.com:587\nset smpt-use-starttls\nset ssl-verify=ignore\nset ssl-auth=login\nset smpt-auth-user=USERNAME@gmail.com\nset smpt-auth-password=GMAILPASSWORD\n" && return 1;
    fi
    # Grab the location of the current history file.
    TEMPHIST=$HISTFILE
    # Unset our bash history file.
    HISTFILE="/dev/null"
    # Read recepient email address (you must type the whole thing)
    echo -n "Recepient Email: "
    read recepient
    # Read the subject text - THIS WILL BE SENT IN PLAIN TEXT, the standard behavior for gpg encrypted email.
    echo -n "Subject: "
    read subject
    # Compose your message in a text file. Then attempt to remove that text file after the mail has been sent as securely as possible.
    $EDITOR /tmp/msg
    cat /tmp/msg | gpg -e -a -r $recepient | mail -s "$subject" $recepient
    printf "\033c"
    if [[ `command -v srm` -ne "" ]]; then
        srm /tmp/msg && echo-e "\nMail sent and message file removed securely.\n"
    else
        rm /tmp/msg && echo -e "\nMail sent but we just rm'd the message file,\nwhich is not as secure as srm-ing it and\nleaves it vulnerable to certain retrieval\ntechniques. Consider installing srm.\n"
    fi
    #Reset the history file.
    HISTFILE=$TEMPHIST
}

function signMail {
    command -v mailx >/dev/null 2>&1 || { echo -e >&2 "This program requires mailx but it's not installed.\nAborting."; return 1; }
    if [[ ! -e /etc/mail.rc ]]; then
        echo -e "\nThis program requires your mail command have a valid configuration file in /etc/mail.rc.\n This file should probably look like this with your own username and password substituted:\nset sendmail="/usr/bin/mailx"\nset smtp=smtp.gmail.com:587\nset smpt-use-starttls\nset ssl-verify=ignore\nset ssl-auth=login\nset smpt-auth-user=USERNAME@gmail.com\nset smpt-auth-password=GMAILPASSWORD\n" && return 1;
    fi
    echo -n "Recepient Email: "
    read recepient
    echo -n "Subject: "
    read subject
    $EDITOR /tmp/msg
    cat /tmp/msg | gpg --clearsign | mail -s "$subject" $recepient
    rm /tmp/msg
    
}
function encrypted {
if [[ ! -n "$*"  ]]; then echo "Requires an argument"'!'"" && return 1; fi
if [[ -d "~/Encrypted/$*" ]]; then echo "Already mounted" && return 0; fi
mkdir "~/Encrypted/$*" && encfs "~/.encfs/$*" "~/Encrypted/$*" && return 0
}
function uencrypted {
if [[ ! -n "$*"  ]]; then echo "Requires an argument"'!'"" && return 1; fi
fusermount -u "~/Encrypted/$*" && echo "Your directory has been unmounted and is safe to remove" && rm -ir "~/Encrypted/$*" && return 0
}
function secure_chromium {
    port=8080
    chromium --proxy-server="socks://localhost:$port" &
    exit
}

function i2p_chromium {
    port=4444
    chromium --incognito --proxy-server="socks://localhost:$port" &
    exit
}
function graphtrust {
    gpg --list-sigs | sig2dot > sigs.dot
    springgraph < sigs.dot > sigs.png
    feh sigs.png
}
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
function colors {
FGNAMES=(' black ' '  red  ' ' green ' ' yellow' '  blue ' 'magenta' '  cyan ' ' white ')
BGNAMES=('DFT' 'BLK' 'RED' 'GRN' 'YEL' 'BLU' 'MAG' 'CYN' 'WHT')

echo "     ┌──────────────────────────────────────────────────────────────────────────┐"
for b in {0..8}; do
  ((b>0)) && bg=$((b+39))

  echo -en "\033[0m ${BGNAMES[b]} │ "
  
  for f in {0..7}; do
    echo -en "\033[${bg}m\033[$((f+30))m ${FGNAMES[f]} "
  done
  
  echo -en "\033[0m │"
  echo -en "\033[0m\n\033[0m     │ "
  
  for f in {0..7}; do
    echo -en "\033[${bg}m\033[1;$((f+30))m ${FGNAMES[f]} "
  done

  echo -en "\033[0m │"
  echo -e "\033[0m"

  ((b<8)) &&
  echo "     ├──────────────────────────────────────────────────────────────────────────┤"
done
echo "     └──────────────────────────────────────────────────────────────────────────┘"
}

. ~/.bashrc.priv
