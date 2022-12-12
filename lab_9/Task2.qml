import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    AnimatedSprite {
        anchors.centerIn: parent
        source: "https://i.ibb.co/B46dWDn/Attack.png"
        width: 480
        height: 480
        frameCount: 4
        frameWidth: 480 / 4
        frameHeight: 80
        frameSync: true
    }
}
