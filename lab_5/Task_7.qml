import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: task_7
    SilicaWebView {
        id: webView
        anchors.fill: parent
        url: "https://ya.ru/"
        header: PageHeader {
            title: "Yandex"
            description: webView.title
        }
    }
}

