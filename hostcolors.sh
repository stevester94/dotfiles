getHostColor() {
h=`hostname`
    if [ "$h" == penguin ]; then printf $LIGHT_BLUE
    elif [ "$h" == htpc ]; then printf $BLUE
    else printf $LIGHT_GREY
    fi
    
}
