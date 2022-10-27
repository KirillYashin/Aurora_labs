import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: task_5
    Column {
       spacing: 10
       anchors.fill: parent
       PageHeader {
           title: "Ввод времени"
       }
       Button {
           text: "Ввести время"
           onClicked: dialog.open()
       }
       TimePickerDialog {
           id: dialog
           onAccepted: outText.text = timeText
       }
       TextField {
           id: outText
       }
    }
}
