ARTISAN_APP=artisan

function main() {
	ourArtisan $@
}

function ourArtisan()  {
 	runLaravelArtisan $@
}

function runLaravelArtisan() {
	findLaravelArtisan
	if [ "$ARTISAN_APP" != "" ] && [ -f $ARTISAN_APP ]; then 
		echo "Artisan found at $ARTISAN_APP"
		php $ARTISAN_APP $@
		exit 1
	else
		echo "sorry, no artisan found"
	fi
}

function findLaravelArtisan() {

	# get the current directory
	dir=`pwd`
	# break it to an array
	dirs=(${dir//\// })
	# get the number of items
	I=${#dirs[@]}

	#
	while [ $I -gt 0 ]; do 
		dir=
		x=$I
		for current in "${dirs[@]}"; do
		    dir=$dir/$current
		    ((x--))
		    if [ $x = 0 ]; then
		    	break
		    fi
		done
		if [ -f "$dir/$ARTISAN_APP" ]; then
			app="$dir/$ARTISAN_APP"
			break
		fi
		((I--))
	done

	if [[ "$app" != "" ]]; then
		ARTISAN_APP=$app
	fi

}

main $@