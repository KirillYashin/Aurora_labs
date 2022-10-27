import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    id: task_10
    SilicaListView {
        anchors.fill: parent
        model: ListModel {
            id: task
            ListElement { option: "Контекстное меню 1" }
            ListElement { option: "Контекстное меню 2" }
            ListElement { option: "Контекстное меню 3" }
        }
        delegate: ListItem {
            width: ListView.view.width
            Label {
                text: model.option
                anchors.centerIn: parent
            }
            menu: ContextMenu {
                MenuItem {
                    text: "Элемент 1"
                    onClicked: console.log(model + " " + text)
                }
                MenuItem {
                    text: "Элемент 2"
                    onClicked: console.log(model + " " + text)
                }
            }
        }
    }
}

