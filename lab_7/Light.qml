import QtQuick 2.0
import Sailfish.Silica 1.0

Grid {
    id: grid
    columns: 1
    rows: 3
    spacing: 20
    state: "default"

    property int counter: 0
    Component.onCompleted: anim.restart()

    SequentialAnimation {
        id: anim
        loops: Animation.Infinite
        PropertyAnimation {
            target: grid
            properties: "counter"
            from: 0
            to: 9
            duration: 9000
        }
    }

    states: [
        State {
          name: "default"
        },
        State {
            name: "red"
            when: grid.counter >= 0 && grid.counter < 3
            PropertyChanges {
                target: redCircle
                color: "red"
            }
        },

        State {
            name: "yellow"
            when: grid.counter >= 3 && grid.counter < 6
            PropertyChanges {
                target: yellowCircle
                color: "yellow"
            }
        },

        State {
            name: "green"
            when: grid.counter >= 6 && grid.counter < 9
            PropertyChanges {
                target: greenCircle
                color: "green"
            }
        }

    ]

    Rectangle {
        id: redCircle
        color: "black"
        width: 100
        height: 100
        radius: 180
    }

    Rectangle {
        id: yellowCircle
        color: "black"
        width: 100
        height: 100
        radius: 180
    }

    Rectangle {
        id: greenCircle
        color: "black"
        width: 100
        height: 100
        radius: 180
    }
}

