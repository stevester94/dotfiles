getHostColor() {
h=`hostname`
    if [ "$h" == penguin ]; then
        printf $LIGHT_BLUE
    fi
}
