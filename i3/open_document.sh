#!/usr/bin/bash

dir="$HOME/documents/"
file=$(find $HOME/documents/ -maxdepth 2 -type f -print0 | xargs -0 basename -a | dmenu)
document_path=$(find "$dir" -type f -maxdepth 2 | grep "$file")
zathura "$document_path" --fork
