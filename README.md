# fix-greek-subs
A small script helping to replace invalid characters inside common greek subtitle files (.srt only), namely **`Ά`** in place of **`’`**, in various GNU Linux distributions.

The existence of such characters comes from the fact that non-unicode encodings are commonly used in subtitle files all over the world. From this aspect, the maker hopes that this global practice will disappear soon and the script will become useless. :-)

Localization includes Greek and English messages.

## How it works
The script simply replaces the "bad" character that exist in most widely spread greek .srt files with the correct one, and converts the files to UTF-8 encoding. Of course, it can be modified to replace other characters as well.

The algorithm **does NOT run recursively**, in order for the user to have more control on the results.

It allows to be used by a non-root user.

## Requirements
Common command line tools have been used, in order for the depentencies to be minimal. Practically, most GNU Linux desktop distributions have these tools preinstalled.

`grep`, `cut`, `iconv`, `perl` and `notify-send` commands are used here.

## Installation
fix-greek-subs is a "standalone" solution with the following simple syntax:

`sh fix-greek-subs.sh [directory_name]`

where `[directory_name]` is the full path of the folder containing the subtitles to be processed, e.g.:

`sh fix-greek-subs.sh /home/kostas/Videos/Comedies`

If required for convenience, it can be embedded to a context menu action. For this to work, simply copy the script inside a `.fix-greek-subs` directory in your home folder (or inside a global location for multiuser installation), and the .desktop file at the appropriate location for context menu actions (instructions below, suggestions for more Desktop Environments or File Managers are more than welcomed).

### KDE Plasma 5 (Dolphin)
Git clone or download the zip file and extract. As a normal (non-root) user, run these commands in a terminal:
```
mkdir -p ~/.fix-greek-subs ~/.local/share/kservices5/ServiceMenus
cd <location-of-the-extracted-files> # if you are not there already
cp fix-greek-subs.sh ~/.fix-greek-subs/
cp fix-greek-subs.desktop ~/.local/share/kservices5/ServiceMenus/
```
After this, open a **new instance** of Dolphin and find the folder that contains the .srt files. Right-click on it and choose `Actions` => `Fix all GREEK subtitles (.srt) in folder` (or the greek translation).

## Precautions
The script assumes that the discovered subtitle files are greek. If this is not the case, problems may appear in some other languages' subtitle files. Please, be sure you have control on the kind of files you are processing. **Always have backup of your .srt files before the execution of the script on them**.

## Disclaimer
This software is distributed with the hope that it will be usefull to others, as it is for his maker. It was tested only in the maker's and contributors' digital environment and contitions. As such, the maker and the contributors of this software are not responsible for any damage that would be caused by the use of the software.
