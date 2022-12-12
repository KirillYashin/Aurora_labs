import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Canvas {
        width: parent.width
        height: parent.height
        onPaint: {
            var c = getContext("2d");
            c.fillStyle = "lightblue";
            c.fillRect(0, 0, width, height / 1.3);
            c.fillStyle = "green"
            c.fillRect(0, height / 1.3, width, height - height / 1.3)
            c.fillStyle = "yellow";
            c.fillRect(width / 2 - 230, height / 3 + 310, 460, 360)
            c.fillStyle = 'brown'
            c.fillRect(width / 2 + 100, height / 3 + 70, 50, 150)
            c.fillStyle = 'red'
            c.beginPath()
            c.moveTo(width / 2, height / 3 + 100);
            c.lineTo(width / 2 + 300, height / 2 + 100);
            c.lineTo(width / 2 - 300, height / 2 + 100);
            c.fill();
            c.closePath();
        }
    }
}
