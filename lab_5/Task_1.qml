import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: task_1
    Column {
        spacing: 10
        anchors.fill: parent
        PageHeader {
            title: "Страница"
        }
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Вперед"
            onClicked: pageStack.push(Qt.resolvedUrl("MainPage.qml"))
        }
        Label {
            text: "Глубина стека: " + pageStack.depth
        }
    }
}

