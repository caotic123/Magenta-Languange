#include <map>
#include <string>
#include <stdlib.h>
#include <vector>
#include <list>
#include <utility>
#include <stdarg.h>
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
    std::string getFile__(std::string name);
    void create_label(std::string& cod, std::string label);
    std::string create_func(std::string func, std::string type, std::vector<std::string> p__);
    void insert__to_code(std::string& x_, std::string c_);
    void end_func(std::string& x_);
    void create_variable_bool(std::string& cod__, int* q_, std::string variable_name, bool t);
    void change_variable_bool(std::string& cod__, int* q_, std::string variable_name, bool t);
    void add_value(std::string& cod__, std::string x, std::string y, int* q, int* n);
    void mul_value(std::string& cod__, std::string x, std::string y, int* q, int* n);
};

#endif
