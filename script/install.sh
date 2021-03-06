#!/bin/bash

#            --------------------------------------------------
#                               ProtonScript               
#            --------------------------------------------------
#                  Copyright (C) <2019>  <Entynetproject>
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.

RS="\033[31m"
WHS="\033[0;97m"
CE="\033[0m"
G="\033[1m"
R="\033[1m"
E="\033[0m"

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e "\n(1/1) Installing ProtonScript ..... [ "$R"FAIL"$E" ]\n"
   exit
fi

if [[ -d /data/data/com.termux ]]
then
pspath="/data/data/com.termux/files/usr/bin/proton"
else
pspath="/usr/local/bin/proton"
fi

if [[ -f $pspath ]]
then
  sleep 0
else
  echo -e ""$RS"[-]"$WHS" Proton Framework is not installed!"$CE""
  exit
fi

sleep 1
echo -e "\n(1/1) Installing ProtonScript ..... [ "$G"OK"$E" ]"

{
cd ~/proton/script
cp pscript /usr/local/bin
chmod +x /usr/local/bin/pscript
cp pscript /bin
chmod +x /bin/pscript
cp pscript /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/pscript
cd ~/proton/script/psenv
cp psenv /usr/local/bin
chmod +x /usr/local/bin/psenv
cp psenv /bin
chmod +x /bin/psenv
cp psenv /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/psenv
cd ~/proton/script/nanorc
cp pscript.nanorc /usr/local/share/nano
cp pscript.nanorc /usr/share/nano
} &> /dev/null
sleep 5
echo -e ""
