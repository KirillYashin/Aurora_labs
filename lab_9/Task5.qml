import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    Audio {
        id: audio
        playlist: Playlist {
            id: playlist
            playbackMode: Playlist.Loop
            PlaylistItem { source: "https://audio.jukehost.co.uk/xT7DJin1rhWWLMTu49sZjH5OLtyV3ouh.mp3" }
            PlaylistItem { source: "https://audio.jukehost.co.uk/8lNNgESMFPkOV0REGNBol5DweCyunOWC.mp3" }
            PlaylistItem { source: "https://audio.jukehost.co.uk/Re02dsp0gnLDiaGzA07ipTzLGN1PP5Yo.mp3" }
        }
    }
    Row {
        anchors.centerIn: parent
        IconButton {
            icon.source: "image://theme/icon-m-media-rewind"
            onClicked: {
                audio.playlist.previous()
            }
        }
        IconButton {
            id: play
            icon.source: "image://theme/icon-m-play"
            onClicked: {
                if (play.icon.source == "image://theme/icon-m-play") {
                    audio.play();
                    play.icon.source = "image://theme/icon-m-pause"
                } else {
                    audio.pause()
                    play.icon.source = "image://theme/icon-m-play"
                }
            }
        }
        IconButton {
            icon.source: "image://theme/icon-m-media-forward"
            onClicked: {
                audio.playlist.next()
            }
        }
    }
}
