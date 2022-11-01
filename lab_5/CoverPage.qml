import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: cover
    property int current: 2
    property int prev: 1
    property int prev_prev: 1
    property string output: "1 1 2"

    Label {
        anchors.centerIn: parent
        text: output
    }
    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-cover-cancel"
            onTriggered: {
                cover.prev_prev = 1
                cover.prev = 1
                cover.current = 2
                cover.output = "1 1 2"
            }
        }
        CoverAction {
            iconSource: "image://theme/icon-cover-new"
            onTriggered: {
                cover.prev_prev = cover.prev
                cover.prev = cover.current
                cover.current = cover.prev + cover.prev_prev
                cover.output = cover.output + " " + cover.current.toString()
            }
        }
    }
}
