# bunch of random paths..
declare paths="
~/bin
~/bin/*/
/usr/local/sbin
/usr/local/bin
/opt/local/sbin
/opt/local/bin
/usr/sbin /usr/bin
/sbin /bin
/etc
/usr/bin/X11 /usr/X11/bin /usr/X11R6/bin /usr/openwin/bin
/usr/gnu/bin
/usr/ucb /usr/bsd /usr/games /usr/ccs/bin /usr/local/java/bin
/usr/contrib/bin /usr/contrib/bin/X11
"
for i in ${paths}
do
   if [[ :${PATH}: =~ :${i}: ]]
   then
       # echo $i already in PATH
       :
   elif [[ -d ${i} ]]
   then
       # echo adding $i
       PATH=${PATH}:${i}
   fi
done

declare manpaths="
~/man
/usr/local/man
/usr/local/share/man
/usr/man
/usr/share/man
/usr/openwin/man
/usr/contrib/man
/usr/lib/scohelp/man
scohelp
/usr/share/catman
/opt/man
/usr/lib/SoftWindows/man
/usr/bin/man
/usr/dt/man
"
for i in ${manpaths}
do
   if [[ :${MANPATH}: =~ :${i}: ]]
   then
       # echo $i already in MANPATH
       :
   elif [[ -d ${i} ]]
   then
       # echo adding $i
       MANPATH=${MANPATH}:${i}
   fi
done


export EDITOR=emacs
export VISUAL=${EDITOR}
export PS1='[\u@\h${STY:+(${STY#*.})} \W]\\$ '

case "$TERM" in
xterm*|rxvt*)
    PS1='\[\e]0;\u@\h \W\a\]'${PS1}
    ;;
*)
    ;;
esac

[[ -f ~/.bash_alias ]] && . ~/.bash_alias

shopt -s extglob
for f in ~/.bashrc.d/!(*~)
do
    [[ -f ${f} ]] && . "${f}"
done

[[ -f ~/.cvsrc ]] && . ~/.cvsrc

[[ -f ~/.p4rc ]] && . ~/.p4rc

[[ -f ~/.ccacherc ]] && . ~/.ccacherc


HISTSIZE=10000
HISTFILESIZE=1000000000

# Android defense
export STAY_OFF_MY_LAWN=1
# I really do manage my own depot_tools
export DEPOT_TOOLS_UPDATE=0
# don't gimme a prompt for licenses
export CHROME_HEADLESS=1
# disable gyp
export GYP_CHROMIUM_NO_ACTION=1