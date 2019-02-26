ARTISAN_APP=./artisan

function main() {
    runLaravelArtisan "$@"
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
    #find artisan or stop on /
    dir=..; until [[ -e $dir/artisan || $dir -ef / ]]; do dir+=/..; done

    #convert path to absolute path
    dir=`cd "$dir"; pwd`

    #make artisan file path
    app=$dir/artisan

    echo $app
    # was it found?
    if [[ "$app" != "" ]]; then
        ARTISAN_APP=$app
    fi
}

main "$@"
