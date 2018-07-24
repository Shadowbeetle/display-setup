function print_usage () {
    echo "Setup dual lapotop and HDMI display"
    echo ""
    echo "Usage: dispsp POSITION where position is one of:"
    echo "       above"
    echo "       below"
    echo "       right-of"
    echo "       left-of"
}

if [ -z $1 ]; then
    echo "POSITION expected"
    print_usage
    exit 1
fi

if [ $1 = "-h" ]; then
    print_usage
    exit 0
fi

POSITION="$1"
HDMI=$(xrandr -q | grep " connected" | awk '/HDMI/{print $1}')
EDP=$(xrandr -q | grep " connected" | awk '/eDP/{print $1}')

xrandr --output $HDMI --primary --$POSITION $EDP