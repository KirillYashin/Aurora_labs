import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Grid {
        columns: 1
        rows: 6
        spacing: 20
        anchors.centerIn: page

        Button {
            text: qsTr("Задание 1")
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Task1.qml"))
        }

        Button {
            text: qsTr("Задание 2")
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Task2.qml"))
        }

        Button {
            text: qsTr("Задание 3")
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Task3.qml"))
        }

        Button {
            text: qsTr("Задание 4")
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Task4.qml"))
        }

        Button {
            text: qsTr("Задание 5")
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Task5.qml"))
        }

        Button {
            text: qsTr("Задание 6")
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Task6.qml"))
        }
    }
}
