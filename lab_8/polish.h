#ifndef POLISH_H
#define POLISH_H

#include <QObject>
#include <QString>
class Polish : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString result READ get_result NOTIFY translated)
    public:
     QString result;
     char stack[256];
     Polish();
     QString get_result();
     Q_INVOKABLE void translate(QString str);
     void PostfixNotation(const char *_infix, char *_postfix);
     void push(char *_stack, int &_ptr, char data);
     char pop(char *_stack, int &_ptr);
    signals:
     void translated();
};

#endif // POLISH_H
