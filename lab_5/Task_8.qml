import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: task_8

    ListModel {
        id: task
        ListElement { name: "ПРЕСС КАЧАТ"; date: "27.10.2022" }
        ListElement { name: "БЕГИТ"; date: "27.10.2022" }
        ListElement { name: "ТУРНИК"; date: "28.10.2022" }
        ListElement { name: "АНЖУМАНЯ"; date: "29.10.2022" }
        ListElement { name: "Извиниться за тупую шутку из мема"; date: "01.11.2022" }
        ListElement { name: "Подготовить релиз"; date: "05.11.2022" }
        }
     SlideshowView {
         id: view
         model: task
         anchors.fill: parent
         delegate: Rectangle {
             width: view.itemWidth
             height: view.height
             Text {
                  anchors.centerIn: parent
                  text: name + " - " + date
             }
      }
   }
}

