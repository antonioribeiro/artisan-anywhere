ARTISAN_APP=./artisan

function main() {
    runLaravelArtisan $@
}

function runLaravelArtisan() {

    # is there an artisan in current folder?
    if [ ! -f $ARTISAN_APP ]; then 
        findLaravelArtisan
    fi

    # artisan was found?
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

    # search down for artisan
    ARTISAN_APP=artisan
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

    # was it found?
    if [[ "$app" != "" ]]; then
        ARTISAN_APP=$app
    fi

}

main $@