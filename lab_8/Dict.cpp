#include "Dict.h"

Dict::Dict() : QObject() {
 this->list = QStringList();
}

void Dict::append(QString str) {
    this->list.append(str.toLower());
    emit listChanged();
}

void Dict::removeLast() {
    this->list.removeLast();
    emit listChanged();
}

QString Dict::getText() {
    QString text = this->list.join(", ");
    return text.replace(0, 1, text[0].toUpper());
}

