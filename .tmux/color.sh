#!/usr/bin/env bash
# background: tmux 256 colour
# foreground: standard 0-7 color

for i in $(seq 0 4 255); do
	for j in $(seq $i $(expr $i + 3)); do
    for l in $(seq 0 7); do
      name=$(printf "fg=%s,bg=%03s" "${l}" "${j}")
		  printf "\x1b[3${l};48;5;${j}m ${name} \x1b[m"
    done
	  printf "\n"
	done
done
