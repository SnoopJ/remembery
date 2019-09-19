#!/bin/bash

RDIR="/home/snoopjedi/www/remembery"
MARKDOWNPY="/home/snoopjedi/.local/bin/markdown_py"

inotifywait -r -m -e modify --excludei ".*\.html" --format '%f' $RDIR | while read FN; do
    FP=$(echo $FN | sed "s/\.[^.]*//") 
    echo "Rebuilding $RDIR/$FP.html"
    $MARKDOWNPY -f "$RDIR/$FP.html" "$RDIR/$FP.md"
done
