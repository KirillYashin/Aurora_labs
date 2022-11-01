import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        CustomButton {
            Text {
                text: "Кнопка 1"
            }
            c: "green"
        }
        CustomButton {
            y: 100
            Text {
                text: "Кнопка 2"
            }
            c: "red"
        }
    }
}
