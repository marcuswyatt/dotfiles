#!/usr/bin/env sh

defaults write com.apple.Xcode PBXCustomTemplateMacroDefinitions '{ORGANIZATIONNAME="Visfleet Ltd.";EMAIL="marcus.wyatt@visfleet.com";WEBADDRESS="http://www.visfleet.com";COMPANYNAME="Visfleet Ltd.";}'

scp root@qa-integrate.vworkapp.com:/opt/apps/current/public/vwork.swf /Volumes/Data/Marcus/Work/git/vWork/public/vwork.swf