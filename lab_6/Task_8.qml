import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    id: page

    ConfigurationGroup {
        id: settings
        path: "/path"
    }
    Column {
        width: page.width
        spacing: 10
        TextField {
            width: parent.width
            id: txtfield
        }
        Button {
            width: parent.width
            text: "Сохранить текстовый параметр"
            onClicked: {
                settings.setValue("setting1", txtfield.text)
                console.log(settings.value("setting2"))
                setting1.text = settings.value("setting1") + " выбран"
            }
        }
        Label {
            id: setting1
            text: ""
        }
        TextSwitch {
            id: text_switch
            text: "Свитчер:"
            onCheckedChanged: {
                settings.setValue("setting2", text_switch.checked?"On":"Off")
                console.log(settings.value("setting2"))
                setting2.text = settings.value("setting2") + " выбран"
            }
        }
        Label {
            id: setting2
            text: ""
        }
    }
}
