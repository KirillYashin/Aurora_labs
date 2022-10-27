import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: task_3
    Column {
        spacing: 10
        anchors.fill: parent
        PageHeader {
            title: "Ввод текста"
        }
        Button {
            text: "Ввести текст"
            onClicked: dialog.open()
        }
        Dialog {
            id: dialog
            Column {
                width: page.width
                DialogHeader{}
                TextField {
                    id: inText
                }
            }
            onAccepted: outText.text = inText.text
         }
         TextField {
             id: outText
         }
     }
}

