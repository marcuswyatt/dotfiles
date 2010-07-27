#!/usr/bin/env sh

defaults write com.apple.Xcode PBXCustomTemplateMacroDefinitions '{ORGANIZATIONNAME="Exceptionz Ltd.";EMAIL="marcus@exceptionz.com";WEBADDRESS="http://www.exceptionz.com";COMPANYNAME="Exceptionz Ltd.";}'
# 
# if [[ ! -d /Volumes/Music ]]; then
# 	mkdir /Volumes/Music
# fi
# 
# if [[ ! -d /Volumes/Games ]]; then
# 	mkdir /Volumes/Games
# fi
# 
# if [[ ! -d /Volumes/Pictures ]]; then
# 	mkdir /Volumes/Pictures
# fi
# 
# if [[ ! -d /Volumes/Files ]]; then
# 	mkdir /Volumes/Files	
# fi
# 
# if [[ ! -d /Volumes/Videos ]]; then
# 	mkdir /Volumes/Videos
# fi
# 
# 
# mount_smbfs //Marcus:Ch4rl0tt3@file-server.local/music /Volumes/Music
# mount_smbfs //Marcus:Ch4rl0tt3@file-server.local/game /Volumes/Games
# mount_smbfs //Marcus:Ch4rl0tt3@file-server.local/picture /Volumes/Pictures
# mount_smbfs //Marcus:Ch4rl0tt3@file-server.local/public /Volumes/Files
# mount_smbfs //Marcus:Ch4rl0tt3@file-server.local/video /Volumes/Videos