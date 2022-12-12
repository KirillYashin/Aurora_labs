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

#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif
#include <auroraapp.h>
#include "Counter.h"
#include "Dict.h"
#include "polish.h"
int main(int argc, char *argv[]) {
    {
     const QMetaObject meta = Counter::staticMetaObject;
     QObject *obj = meta.newInstance();
     QObject::connect(obj, SIGNAL(countChanged()), obj, SLOT(print()));
     meta.invokeMethod(obj, "increment");
     meta.invokeMethod(obj, "increment");
     meta.invokeMethod(obj, "increment");
     meta.invokeMethod(obj, "reset");
    }

    QGuiApplication *app = Aurora::Application::application(argc, argv);
    QQuickView *view = Aurora::Application::createView();
    view->setSource(Aurora::Application::pathTo("qml/lab_8.qml"));
    qmlRegisterType<Counter>("custom.Counter", 1, 0, "Counter");
    qmlRegisterType<Dict>("custom.Dict", 1, 0, "Dict");
    qmlRegisterType<Polish>("custom.Polish", 1, 0, "Polish");
    view->showFullScreen();
    return app->exec();
}
