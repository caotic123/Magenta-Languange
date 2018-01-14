#include <map>
#include <string>
#include <stdlib.h>
#include <vector>
#include <list>
#include <utility>
#include <stdarg.h>
#include <algorithm>
#include <fstream>
#include <iostream>
#include "magenta_header.h"

#ifndef MODULE_H
#define MODULE_H

class __code {
public:
    __code()
    {
        code = "";
    }

    template <typename T>
    void insert(T x, bool p = false)
    {
        if (p) {
            code = code.substr(0, code.length() - 1);
        }
        code = (std::string)code + x;
    }

    void insert_int_32(const char* del, int len, ...)
    {
        int32_t val;
        char buffer[100];
        va_list __;
        va_start(__, len);
        for (int i = 0; i < len; i++) {
            val = va_arg(__, int32_t);
            sprintf(buffer, "%d", val);
            code = code + std::string(buffer) + std::string(del);
        }
        va_end(__);
    }

    void insert_t(int len = 1, ...)
    {
        const char* val;
        va_list __;
        va_start(__, len);
        for (int i = 0; i < len; i++) {
            val = va_arg(__, const char*);
            code = code + val + " ";
        }
        va_end(__);
    }

    void __end()
    {
        code = "";
    }

    void s_() { code = code + "\n"; }

    std::string string()
    {
        return code;
    }

private:
    std::string code;
};

class magneta_module {
public:
    magneta_module();
    void create_label(std::string& cod, std::string label);
    std::string create_func(std::string func, std::string type, std::vector<std::string> p__);
    void insert__to_code(std::string& x_, std::string c_);
    void end_func(std::string& x_, bool is_main);
    void create_return_function(std::string& cod__, std::string v_);
    void end_selection(std::string& cod, int* __l, std::vector<std::tuple<int, int, std::vector<std::string> > > * __stack);
    std::string cond__if(__code& x, std::string cond_1, std::string cond_2, std::string type, std::string op, int* q, int* __e);
    void create_if_condition(std::string& cod__, type_ type, std::string op, std::vector<std::string> __cond, int* q, int* __e, int* __l, std::vector<std::tuple<int, int, std::vector<std::string> > > * __stack);
    void load_value(__code& x, std::string name, std::string v, std::string type_);
    std::string load_number_value(std::string& cod__, int* __e, std::string name, std::string v_);
    void create_unknowtype_var(std::string& cod__, std::string name, std::string ref, int* q);
    void create_variable_number(std::string& cod__, std::string name, std::string var, int* q_, int* e);
    void change_variable_number(std::string& cod__, std::string name, std::string var, int* q_, int* e);
    void while_selection(std::string& cod__, int* __l, std::vector<std::tuple<int, int, std::vector<std::string> > > * __stack, int* q, int* __e);
    void create_call_func(std::string& cod__, std::string func_name, std::vector<std::string> par__, std::string v_, int* q);
    void change_call_func(std::string& cod__, std::string func_name, std::vector<std::string> par__, std::string v_, int* q);
    void pointer_to_point(std::string& cod, std::string name, std::string v, int* q);
    void create_variable_expression_number(std::string& cod__, std::string var_, int* q_);
    void alloc_variable_str(std::string& cod__, std::string name, std::string len, int* q_);
    void create_variable_str(std::string& cod__, std::string name, std::string str__, int* q);
    std::string load_bool_value_cond(std::string& cod__, int* __e, std::string name, std::string v_);
    void change_variable_str(std::string& cod__, std::string name, std::string str__, int* q_);
    void change_pointer_variable_str(std::string& cod__, std::string name, std::string str__, int* q_);
    std::string load_number_value_cond(std::string& cod__, int* __e, std::string name, std::string v_);
    void change_variable_expression_number(std::string& cod__, std::string var, int* q, int* __e);
    void create_variable_bool(std::string& cod__, int* q_, int* ___e, std::string variable_name, bool t);
    void change_variable_bool(std::string& cod__, int* q_, int* ___e, std::string variable_name, bool t);
    std::string load_bool_value(std::string& cod__, int* __e, std::string name, std::string v_);
    void add_value(std::string& cod__, std::string x, std::string y, int* q, int* n, int* __e);
    void sub_value(std::string& cod__, std::string x, std::string y, int* q, int* n, int* __e);
    void div_value(std::string& cod__, std::string x, std::string y, int* q, int* n, int* __e);
    void mul_value(std::string& cod__, std::string x, std::string y, int* q, int* n, int* __e);
};

#endif
