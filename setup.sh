#!/bin/bash
set -e

export PATH="/opt/homebrew/bin:$PATH"

collect_scripts() {
	section=pre_scripts
	while IFS=' ' read -r method arg _; do
		arg=${arg#\"}
		arg=${arg%\"}
		case $method in
			''|'#'*)
				continue
				;;
			script)
				if [ "$section" = pre_scripts ]; then
					pre_scripts="$pre_scripts $arg"
				else
					section=post_scripts
					post_scripts="$post_scripts $arg"
				fi
				;;
			*)
				if [ "$section" = post_scripts ]; then
					echo "invalid formula $arg post_scripts section"
					exit 1
				fi
				section=formula
				;;
		esac
	done < "profiles/$1.rb"
}

collect_brewfile() {
	brewfile="$brewfile
$(grep -Ev '^script +' "profiles/$1.rb")"
}

print_header() {
	tput rev
	echo "$1"
	tput sgr0
}

run_scripts() {
	for script in $1; do
		print_header "$script"
		bash "scripts/${script}.sh"
	done
}

collect_scripts base
collect_scripts "$PROFILE"

collect_brewfile base
collect_brewfile "$PROFILE"

run_scripts "$pre_scripts"
print_header "bundle"
brew bundle --no-upgrade --no-lock --file=<(echo "$brewfile")
run_scripts "$post_scripts"
