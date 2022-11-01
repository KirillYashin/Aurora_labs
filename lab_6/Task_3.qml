import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All
    property var myModel: [
        {myColor: "white", myText: "Белый", myTexColor: "black"},
        {myColor: "black", myText: "Чёрный", myTexColor: "white"},
        {myColor: "blue", myText: "Синий", myTexColor: "red"}
    ]
    SilicaListView{
        anchors.fill: parent
        model: myModel
        delegate: Rectangle {
            width: parent.width
            height: 150
            color: modelData.myColor
            Text {
                anchors.centerIn: parent
                text: modelData.myText
                color: modelData.myTexColor
            }
        }
    }
}

