/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Моё приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All
    property int size: page.width / 3 - 20
    SilicaFlickable {
        anchors.fill: parent
        quickScroll : true
        contentHeight: page.width * 10
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            Item {
                height: size * 1.5
                id: firstItem
                Rectangle{
                        id: first
                        width: size
                        height: size
                        color: "red"
                    }
                    Rectangle{
                        id: second
                        width: size
                        height: size
                        color: "green"
                        anchors.verticalCenter: first.bottom
                        anchors.left: first.right
                    }
                    Rectangle{
                        id: third
                        width: size
                        height: size
                        color: "blue"
                        anchors.left: second.horizontalCenter
                        anchors.bottom: second.verticalCenter
                        Text{
                            text:"Квадрат"
                            color: "white"
                            anchors.centerIn: parent
                        }
                    }
            }
            Item {
                id: secondItem
                height: size * 2
                y: firstItem.height + 30
                Row {
                    spacing: 10
                    Column{
                        spacing: 10
                        Rectangle{
                            width: size
                            height: size
                            color: "red"
                        }
                        Rectangle{
                            width: size
                            height: size
                            color: "violet"
                        }
                    }
                    Rectangle{
                        width: size
                        height: size
                        color: "green"
                    }
                    Column{
                        spacing: 10
                        Rectangle{
                            width: size
                            height: size
                            color: "blue"
                        }
                        Rectangle{
                            width: size
                            height: size
                            color: "black"
                        }
                    }
                }
            }
            Item {
                id: thirdItem
                height: size * 2
                y: secondItem.height + firstItem.height + 90
                Grid{
                    columns: 3
                    rows: 2
                    spacing: 10
                    Rectangle{
                        width: size
                        height: size
                        color: "red"
                    }
                    Rectangle{
                        width: size
                        height: size
                        color: "green"
                    }
                    Rectangle{
                        width: size
                        height: size
                        color: "blue"
                    }
                    Rectangle{
                        width: size
                        height: size
                        color: "violet"
                    }
                    Item{
                        width: size
                        height: size
                    }
                    Rectangle{
                        width: size
                        height: size
                        color: "black"
                    }
                }
            }
            Item {
                id: fourthItem
                height: size * 1.5
                y: thirdItem.height + secondItem.height + firstItem.height + 120
                Rectangle {
                    id: black
                    width: size * 1.5
                    height: size * 1.5
                    color: "black"
                }
                Rectangle {
                    width: size * 1.5
                    height: size * 1.5
                    color: "black"
                    transform: [
                        Scale {
                            xScale: 0.5
                        },
                        Rotation {
                            angle: 45
                        },
                        Translate {
                            x: size * 2.7
                        }
                    ]
                }
            }
            Item {
                id: fifthItem
                height: size
                y: fourthItem.height + thirdItem.height + secondItem.height + firstItem.height + 150
                Rectangle{
                    id: animation
                    color:"black"
                    width: size
                    height: size
                    ParallelAnimation{
                        running: true
                        loops: Animation.Infinite
                        NumberAnimation {
                            target: animation
                            property: "width"
                            to:200
                            duration: 1000
                        }
                        NumberAnimation {
                            target: animation
                            property: "height"
                            to:200
                            duration: 1000
                        }
                        NumberAnimation {
                            target: animation
                            property: "y"
                            to:100
                            duration: 1000
                        }
                    }
                }
            }
            Item{
                y: fifthItem.height+  fourthItem.height + thirdItem.height + secondItem.height + firstItem.height + size * 1.5
                Button {
                    text: "Калькулятор"
                    onClicked:pageStack.push(dialog)
                }
            }
            Component{
                id: dialog
                Dialog {
                    Column {
                        width: parent.width
                        DialogHeader {}
                        TextField {
                            id: num1
                            placeholderText: "0"
                            strictValidation: true
                            validator: IntValidator{}
                        }
                        TextField {
                            id: num2
                            placeholderText: "0"
                            strictValidation: true
                            validator: IntValidator{}
                        }
                        Button {
                            text: "Сумма"
                            width: parent.width
                            onClicked: console.log(parseInt(num1.text) + parseInt(num2.text))
                        }
                    }
                }
            }
        }
    }
}
