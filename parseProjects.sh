#!/bin/bash
mkdir docs
input="repos.txt"
while IFS= read -r line
do
  git clone "$line"
  project=$(basename "$line" ".git"|tr -d '\n')
  doxygen "${project}/docs/Doxyfile"
done <"$input"
