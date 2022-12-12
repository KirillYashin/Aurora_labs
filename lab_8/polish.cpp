#include "polish.h"
#include <cstring>
#include <QDebug>

Polish::Polish() : QObject() {}

void Polish::push(char *_stack, int &_ptr, char data)
{
    _stack[_ptr++] = data;
}

char Polish::pop(char *_stack, int &_ptr)
{
    return _stack[--_ptr];
}

void Polish::PostfixNotation(const char *_infix, char *_postfix)
{
    int st_ptr = 0;				// указатель вершины стека

    int out_index = 0;		// индекс в выходной строке
    int in_index = 0;		// индекс во входной строке

    // начинаем разбор входящей строки (она не должна быть пустой)
    do
    {
        char c = _infix[in_index];	// берем текущий символ входной строки

        switch (c)
        {
            case '+':
            case '-':
                // выталкиваем из стека в выходную строку все операторы с большим или равным приоритетом
                while (st_ptr != 0)
                {
                    char op = this->stack[st_ptr-1];	// оператор в вершине стека
                    if (op != '(')	// все операторы, кроме откр. скобки имеют больший или равный приоритет
                    {
                        _postfix[out_index++] = op;	// добавляем оператор в выходную строку
                        pop(this->stack, st_ptr);			// удаляем оператор из стека
                    }
                    else
                        break;
                }
                // помещаем оператор в стек
                push(this->stack, st_ptr, c);
                break;

            case '*':
            case '/':
                // выталкиваем из стека в выходную строку все операторы с большим или равным приоритетом
                while (st_ptr != 0)
                {
                    char op = this->stack[st_ptr-1];
                    if ((op == '^') || (op == '*') || (op == '/'))
                    {
                        _postfix[out_index++] = op;	// добавляем оператор в выходную строку
                        pop(this->stack, st_ptr);			// удаляем оператор из стека
                    }
                    else
                        break;
                }
                // помещаем оператор в стек
                push(this->stack, st_ptr, c);
                break;

            case '(':
                // просто помещаем в стек
                push(this->stack, st_ptr, c);
                break;

            case ')':
                // выталкиваем из стека в выходную строку все элементы до открывающей скобки (откр. скобку просто отбрасываем)
                while (st_ptr != 0)
                {
                    char op = pop(this->stack, st_ptr);	// забираем из стека оператор
                    if (op == '(')					// если достигли открывающей скобки
                        break;						// выталкивание закончили
                    else
                    {
                        _postfix[out_index++] = op;	// добавили оператор в выходную строку
                    }
                }
                break;

            case '^':
                // помещаем оператор в стек (выталкивать ничего не нужно, нет операторов с большим приоритетом)
                push(this->stack, st_ptr, c);
                break;

            default:		// символ цифры
                _postfix[out_index] = c;	// добавляем цифру в выходную строку
                out_index++;
                break;
        }

        in_index++;	// переходим к следующему символу входной строки
    }
    while (_infix[in_index] != 0);	// разбор закончен

    // выталкиваем все операторы в выходную строку
    while(st_ptr != 0)
        _postfix[out_index++] = pop(this->stack, st_ptr);

    // завершающий символ нуля
    _postfix[out_index] = 0;
}

void Polish::translate(QString str) {
    QByteArray char_arr = str.toLocal8Bit();
    char *start_str = char_arr.data();

    int bracket_count = 0;

    for(int i = 0; i < str.length(); i++) {
        if (str.at(i) == '(' || str.at(i) == ')')
            bracket_count++;
    }

    char final_str[str.length()-bracket_count];

    PostfixNotation(start_str, final_str);

    QString result;

    for (int i = 0; i < str.length()-bracket_count; i++) {
        result += QChar(final_str[i]);
    }

    this->result = result;
    emit translated();
}

QString Polish::get_result() {
    return this->result;
}

