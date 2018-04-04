# Connect to cctv
while true; do
    echo "switch sound to:"
    echo "i) internal sound card"
    echo "h) hdmi output"
    echo "q) quit and take no action"
    read input1

    case $input1 in
        i)
            cp asound/sound_internal.conf ./.asoundrc
            xrandr --output eDP1 --auto --primary
            sudo alsactl nrestore
            break
            ;;
        h)
            cp asound/sound_hdmi.conf ./.asoundrc
            xrandr --output eDP1 --auto --primary --output HDMI1 --auto --left-of eDP1
            sudo alsactl nrestore
            #sudo alsactl restore
            break
            ;;
        Q|q)
            echo "later!"
            break
            ;;
    esac
done
