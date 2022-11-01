#ifndef DICT_H
#define DICT_H
#include <QObject>
#include <QString>
#include <QStringList>
class Dict : public QObject {
     Q_OBJECT
     Q_PROPERTY(QString list READ getText NOTIFY listChanged)

    private:
     QStringList list;

    public:
     Dict();
     Q_INVOKABLE void append(QString str);
     Q_INVOKABLE void removeLast();
     QString getText();

    signals:
     void listChanged();
};
#endif // DICT_H

