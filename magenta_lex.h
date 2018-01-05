#include <string>
#include <vector>
#include <string.h>
#include <sstream>
#include "magenta_header.h"

#ifndef MAGENTA_LEX_H
#define MAGENTA_LEX_H

typedef std::vector<std::string> token;

char* c(char* y, int t, int a);

class lex_ {

public:
    lex_() { n__.push_back("undref"); }
    const char* abstract_logic[__abs][2] = { { "function", ") " }, { "if", " " }, { "while", " " }, { "ret", " " }, { "else", " " }, { "#", " " }, { "end", " " }, { "func", " " } }; //only one character [x] of abstract_logic[__abs][x]
    char char_ign[ig__][2] = { { '\"', '\"' }, { '(', ')' }, { '[', ']' } }; // warning precedence order
    std::string operators[len_op] = { "+", "-", "*", "/", "^", "," }; // operators list expect "," but this is interpreter like this
    std::string cond_ex[_cond_p] = { ">", "<", "!", "=" }; // in the ordem of priority
    char sym_[__symb][2] = { { 0, 0 }, { 92, 122 }, { 65, 90 }, { '+', 0 }, { '-', 0 }, { '/', 0 }, { '*', 0 }, { '%', 0 }, { 34, 35 }, { 60, 62 },
        { 32, 0 }, { 91, 0 }, { 93, 0 }, { 44, 0 }, { 40, 41 }, { 48, 57 } };

    void lex__(std::string x_);
    std::string l__(std::string str, std::string sep, std::string sep_);
    st_ check__();
    void _token___(char* str);
    std::vector<std::string> get__token_();
    std::vector<std::string> get__exp();

private:
    std::string __input;
    token n__;
    token token_lex;
};

#endif
