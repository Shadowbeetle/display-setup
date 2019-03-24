function print_usage () {
    echo "Setup dual lapotop and HDMI display"
    echo ""
    echo "Usage: dispsp CMD where position is one of:"
    echo "       reset:           turn on built-in display and clone it to HDMI"
    echo "       turn-off:        turn-off built-in display and only use HDMI"
    echo "       extend POSITION: extend desktop to HDMI having the HDMI display at POSITION relative to built-in"
    echo "Where POSITION is one of:"
    echo "       above"
    echo "       below"
    echo "       right-of"
    echo "       left-of"
}

if [ -z $1 ]; then
    echo "CMD expected"
    print_usage
    exit 1
elif [ "$1" = "extend" ] && [ -z $2 ]; then
    echo "POSITION expected"
    print_usage
    exit 1
elif [ $1 = "-h" ]; then
    print_usage
    exit 0
fi


CMD="$1"
HDMI=$(xrandr -q | grep " connected" | awk '/HDMI/{print $1}')
EDP=$(xrandr -q | grep " connected" | awk '/eDP/{print $1}')

if [[ "$CMD" = "reset" ]]; then 
    xrandr --output $EDP --auto --primary --output $HDMI --same-as $EDP
elif [[ "$CMD" = "turn-off" ]]; then
    xrandr --output $EDP --off
elif [[ "$CMD" = "extend" ]]; then
    POSITION="$2"
    xrandr --output $HDMI --primary --$POSITION $EDP
else 
    echo "invalid CMD $CMD"
    print_usage
fi
  

