#include <vector>
#include <string>
#include <algorithm>
#include <iterator>
#include "magenta_header.h"
#include "module.h"
#include "magenta_lex.h"
#include "compiler.h"
#include "macro.h"

#ifndef MAGENTA_H
#define MAGENTA_H

class magenta {
public:
    magenta()
    {
        lex = new lex_();
        module = new magneta_module();
        compiler = new magenta_compiler();
    }

    void __tok(std::string __o);
    void load__file(std::string name);
    void __analysis();
    std::string get_str_tok(std::string s_, int n);
    int getn_expression(std::string str_);
    int get_n_variable_decl(std::string s);
    int getn_string(std::string str_);

private:
    lex_* lex;
    magneta_module* module;
    magenta_compiler* compiler;
    token token__;
    token exp_;
    void analy__args(char* s);
    std::string code__;
    void __token();
    bool __func(std::string s);
    bool __if(std::string s);
    bool call__func(std::string s);
    bool var_decl(std::string s);
    bool __while(std::string s);
    bool __ret(std::string s);
    bool __end(std::string s);
};

#endif
