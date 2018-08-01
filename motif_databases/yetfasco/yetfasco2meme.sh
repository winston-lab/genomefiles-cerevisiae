#!/bin/bash

ls *.pfm | while read pfm; do
    id=$(echo $pfm | sed -e 's/.pfm$//g')
    common=$(grep $id yetfasco_name_lookup.tsv | cut -f2)
    cut -f1 --complement $pfm | matrix2meme -bg Scer_markov.txt -dna | awk -v id=$id -v common=$common '$1=="MOTIF"{$2=id;$3=common}{print $0}' > $id.meme
done
