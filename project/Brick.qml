import QtQuick 2.0

Item {

    property int type: 1

    property string src: "bricks.png"

    width: 40
    height: 40

    Image {
        width: parent.width
        height: parent.height

        source: src
    }

    function setType(n) {
        type = n
        switch(n) {
        // black hole
        case 2:
            src = "hole.png"
            break;
        // spring
        //  case 3:
        //     src = "spring.png"
        //     break;
        // bricks otherwise
        default:
            type = 1
            src = "bricks.png"
            break;
        }
    }
}
