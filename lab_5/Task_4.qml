import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: task_4
    Column {
        spacing: 10
        anchors.fill: parent
        PageHeader {
            title: "Ввод даты"
        }
        Button {
            text: "Ввести дату"
            onClicked: dialog.open()
        }
        DatePickerDialog {
            id: dialog
            onAccepted: outText.text = dateText
        }
        TextField {
            id: outText
        }
     }
}
