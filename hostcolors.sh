getHostColor() {
h=`hostname`
    if [ "$h" == penguin ]; then printf $LIGHT_BLUE
    elif [ "$h" == htpc ]; then printf $LIGHT_GREY
    else printf $LIGHT_GREY
    fi
    
}
