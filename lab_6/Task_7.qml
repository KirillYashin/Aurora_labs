import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import Nemo.Configuration 1.0

Page {
    id: page

ConfigurationValue {
    id: setting1
    key: "/apps/app_name/setting1_name";
    defaultValue: ""

}
ConfigurationValue {
    id: setting2
    key: "/apps/app_name/setting2_name";
    defaultValue: ""

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
                setting1.value = txtfield.text
                tsetting1.text = txtfield.text + " выбран"
            }
        }
        Label {
            id: tsetting1
            text: ""
        }
        TextSwitch {
            id: text_switch
            text: "Свитчер:"
            onCheckedChanged: {
                setting2.value = text_switch.checked?"On":"Off"
                tsetting2.text = text_switch.checked?"On":"Off" + " выбран"
            }
        }
        Label {
            id: tsetting2
            text: ""
        }
    }
}
