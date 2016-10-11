#!/bin/sh
#
#================================================================
# HEADER
#================================================================
#% USAGE
#+    sh fix-greek-subs.sh [directory_name]
#%
#% DESCRIPTION
#%    A small script helping to replace invalid characters inside
#%    common greek subtitle files (namely, Ά in place of ’).
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

# check locale
lang=$(locale | grep LC_MESSAGES | cut -d= -f2 | cut -d_ -f1)
el=0
if [ "$lang" = "el" ] || [ "$lang" = "\"el" ] || [ "$lang" = "\'el" ]; then
    el=1
fi

# form notification strings
if [ $el = 1 ]; then # greek
    noreptitle="Δεν έγιναν αντικαταστάσεις χαρακτήρων"
    noreptext="Δεν βρέθηκε αρχείο .srt με κωδικοποίηση iso-8859 στο φάκελο, ή δεν υπάρχει εσφαλμένος χαρακτήρας."
    reptitle1="Έγιναν "
    reptitle2="αντικαταστάσεις"
    reptext="Όλοι οι υπότιτλοι .srt μετατράπηκαν σε κωδικοποίηση UTF-8. Παρακαλώ, αν χρειάζεται, προσαρμόστε τις ρυθμίσεις τού αναπαραγωγέα βίντεο."
    nosrttitle="Κανένα αρχείο .srt"
    nosrttext="Δεν βρέθηκε αρχείο .srt στο φάκελο."
else # anything else, english
    noreptitle="No replacement have been made"
    noreptext="No .srt file with iso-8859 encoding was found in this folder, or no bad character."
    reptitle1=""
    reptitle2="replacements have been made"
    reptext="All .srt subtitles were saved in UTF-8 encoding. Please adjust your player's settings, if necessary."
    nosrttitle="No .srt file"
    nosrttext="No .srt file was found in this folder."
fi

# actual job
count=0
cd "$1"
if ls *.srt 1> /dev/null 2>&1; then # are there .srts in folder?
    for file in *.srt
    do
        if [ `file -b --mime-encoding "$file"` = "iso-8859-1" ]; then # check for encoding
            iconv -f ISO_8859-7:2003 -t UTF8 "$file" -o "$file.tmp" # convert to UTF-8
            count=$(($count + `fgrep -o ’ "$file.tmp" | wc -l`)) # get replacements count
            perl -pe 's/’/Ά/g' "$file.tmp" > "$file" # replace common bad character
            rm "$file.tmp"
        fi
    done
    # Notify user
    if [ "$count" -eq 0 ]; then # no replacement made
        notify-send -t 5000 "$noreptitle" "$noreptext"
    else # job done
        notify-send -t 5000 "$reptitle1$count $reptitle2" "$reptext"
    fi
else
    notify-send -t 5000 "$nosrttitle" "$nosrttext"
fi

exit
