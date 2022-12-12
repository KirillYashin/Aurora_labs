import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Particles 2.0

Page {
    ParticleSystem {
        id: particleSystem
    }
    Emitter {
        system: particleSystem
        width: 10
        height: 10
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        lifeSpan: 1000
        lifeSpanVariation: 1000
        emitRate: 50
        velocity: AngleDirection {
            angle: -90
            angleVariation: 10
            magnitude: 300
        }
    }
    Gravity {
        system: particleSystem
        anchors.fill: parent
        angle: 90
        magnitude: 100
    }
    ItemParticle {
        system: particleSystem
        delegate: Rectangle {
            property int particleSize: 11
            width: particleSize
            height: particleSize
            color: Theme.highlightColor
            radius: particleSize / 2
        }
    }
}
