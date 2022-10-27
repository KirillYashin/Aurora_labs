/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Лаба 4 project.
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
    property int width1: parent.width
    property int height1: parent.height
    SilicaFlickable {
        anchors.fill: parent
        quickScroll : true
        contentHeight: height * 9
        Item {
            id: task_1
            width: width1
            height: height1
            TextField {
                width: width1
                height: height1
                placeholderText: "Введите текст"
                color: "black"
            }
        }

        Item {
            id: task_2
            width: width1
            height: height1
            anchors.top: task_1.bottom
            Button {
                property string _color: "yellow"
                text: "Кнопка"
                backgroundColor: _color
                onClicked: _color = "red"
            }
        }

        Item {
            id: task_3
            width: width1
            height: height1
            anchors.top: task_2.bottom
            Column {
                id: col_1
                property string cond: "Отпущена"
                property bool was_pressed: false
                Row {
                    Button {
                        id: btn_1
                        text: "Кнопка"

                        onClicked: {
                            if(!col_1.was_pressed) {
                                col_1.cond = "Нажата"
                                col_1.was_pressed = true
                            }
                            else {
                                col_1.cond = "Отпущена"
                                col_1.was_pressed = false
                            }
                        }
                    }
                }
                Row {
                    Text {
                        id: text_1
                        text: col_1.cond
                    }
                }
            }
        }

        Item {
            id: task_4
            width: width1
            height: height1
            anchors.top: task_3.bottom
            Column {
                Row {
                    Button {
                        property int count: 0
                        text: "Счетчик: " + count
                        onClicked: {
                            count++;
                        }
                    }
                }
                Row {
                    Text {
                        text: "Считает количество кликов"
                        color: "black"
                    }
                }
            }
        }

        Item {
            id: task_5
            width: width1
            height: height1
            anchors.top: task_4.bottom
            DatePicker {
                date: new Date()
                monthYearVisible: true
                onDateChanged: console.log(date)
            }
        }

        Item {
            id: task_6
            width: width1
            height: height1
            anchors.top: task_5.bottom
            TimePicker  {
                hour: 12
                minute: 00
                onTimeChanged: {console.log(timeText)}
            }
        }

        Item {
            id: task_7
            width: width1
            height: height1
            anchors.top: task_6.bottom
            ComboBox {
                currentIndex: 1
                width: width1 / 2
                label: "Выбор варианта"
                menu: ContextMenu {
                    MenuItem { text: "Красная таблетка" }
                    MenuItem { text: "Синяя таблетка" }
                    MenuItem { text: "Вариант 3" }
                    MenuItem { text: "Вариант 4" }
                    MenuItem { text: "Вариант 5" }
                }
                onCurrentIndexChanged: {console.log(value)}
            }
        }

        Item {
            id: task_8
            width: width1
            height: height1
            anchors.top: task_7.bottom
            property string cond: "ВКЛ"
            Text {
                text: "Свитчер: " + task_8.cond
            }
            Switch {
                checked: true
                onPressed: {
                    if(checked) {
                        task_8.cond = "ВЫКЛ"
                    }
                    else {
                        task_8.cond = "ВКЛ"
                    }
                }
            }
        }

        Item {
            id: task_9
            width: width1
            height: height1
            anchors.top: task_8.bottom
            Column {
                width: width1
                height: height1
                spacing: 100
                Row {
                    width: width1
                    height: 50
                    Slider {
                        id: slider_1
                        width: width1
                        maximumValue: 100.0
                        stepSize: 1.0
                        value: 50
                        onValueChanged: {
                            text_4.val = value
                        }
                    }
                }
                Row {
                    width: width1
                    height: 50
                    Text {
                        id: text_4
                        property int val: slider_1.value
                        text: "Текущее значение: " + val.toString()
                    }
                }
            }
        }
    }
}
