import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: task_9
    SilicaFlickable {
        anchors.fill: parent
        TextField {
            id: tf
        }
        PullDownMenu {
            MenuItem {
                text: "Задача 1"
                onClicked: tf.text = text
            }
            MenuItem {
                text: "Задача 2"
                onClicked: tf.text = text
            }
        }
        PushUpMenu {
            MenuItem {
                text: "Задача 3"
                onClicked: tf.text = text
            }
            MenuItem {
                text: "Задача 4"
                onClicked: tf.text = text
            }
        }
    }
}
