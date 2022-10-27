import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: task_11
    width: parent.width
    height: parent.height

    Cover {
        id: cover
        anchors.fill: parent
        transparent: true

        Label {
            id: lbl
            property int score: 0
            anchors.centerIn: parent
            text: score
        }

        Button {
            id: btn_1
            anchors.top: lbl.bottom
            text: "+"
            onClicked: lbl.score += 1
        }
        Button {
            anchors.top: lbl.bottom
            anchors.right: parent.right
            text: "0"
            onClicked: lbl.score = 0
        }

    }
}
