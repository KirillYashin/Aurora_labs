import QtQuick 2.0
import Sailfish.Silica 1.0
import custom.Polish 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Polish { id: p }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge

            TextField { id: input }
            Button {
                text: "Перевести"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    p.translate(input.text)
                }
            }
            Label {
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingLarge
                text: "Результат: " + p.result
            }


        }
    }
}

