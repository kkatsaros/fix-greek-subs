#!/bin/sh
#
#================================================================
# HEADER
#================================================================
#% USAGE
#+    sh install-kde5.sh
#%
#% DESCRIPTION
#%    Installation of fix-greek-subs in KDE Plasma 5.
#%
#% OPTIONS
#%    No option available yet.
#%    
#================================================================
#- IMPLEMENTATION
#-    version         0.1
#-    author          Kostas Katsaros
#-    copyright       Copyright 2016 (c) Kostas Katsaros
#-    license         GNU General Public License (GPL) 3.0
#-    issue tracking  https://github.com/kkatsaros/fix-greek-subs
#-
#================================================================
#  HISTORY
#     2016/10/10 : kkatsaros : Script creation
# 
#================================================================
# END_OF_HEADER
#================================================================

mkdir -p ~/.fix-greek-subs ~/.local/share/kservices5/ServiceMenus
cp fix-greek-subs.sh ~/.fix-greek-subs/
cp fix-greek-subs.desktop ~/.local/share/kservices5/ServiceMenus/
