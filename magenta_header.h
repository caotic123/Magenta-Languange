#include <vector>
#include <string>
#include <stdarg.h>
#include <algorithm>
#include <fstream>
#include <iostream>

#define __symb 16
#define __abs 8
#define ig__ 3
#define len_op 6
#define _cond_p 4

#ifndef MAGENTA_HEADER_H
#define MAGENTA_HEADER_H

enum type_ {
    unknow_type = 0,
    int8_type = 1,
    int16_type = 2,
    number_type = 3,
    int64_type = 4,
    string_type = 5,
    bool_type = 6,
    number_expression = 7
};

enum type_func {
    NORETURN_TYPE = 1,
    INT_TYPE = 2,
    BOOL_TYPE = 3,
    STRING_TYPE = 4
};

enum type_command {
    VARIABLE_DECLARATION_BOOL = 1,
    CALL_FUNC = 2,
    IF_COND = 3,
    LOOP_WHILE = 4,
    RET_VALUE = 5,
    LABEL_NEW = 6,
    LABEL_GOTO = 7,
    VARIABLE_CHANGE_BOOL = 8,
    OPERATION_ADD_VALUE = 9,
    OPERATION_MUL_VALUE = 10,
    OPERATION_DIV_VALUE = 11,
    OPERATION_SUB_VALUE = 12,
    OPERATION_EX_VALUE = 13,
    NEW_EXPRESSION = 15,
    LOAD_VALUE_BITCAST = 16,
    LOAD_VALUE_BOOL_BITCAST = 17,
    CREATE_VARIABLE_EXPRESSION = 18,
    CHANGE_VARIABLE_EXPRESSION = 19,
    VARIABLE_DECLARATION_number = 20,
    VARIABLE_CHANGE_number = 21,
    DECLARATION_STRING_VAR = 22,
    CHANGE_STRING_VAR = 23,
    CREATE_I8_VAR = 24,
    UNKNOW_TYPE_TO_POINTER = 25,
    END_SELECTION = 26,
    LOAD_VALUE_BITCAST_COND = 27,
    LOAD_VALUE_BOOL_COND = 28,
    END_SELECTION_WHILE = 29,
    ALLOC_STR = 30,
    CHANGE_POINTER_STRING_VAR = 31
};

struct struct_ep {
    std::string s;
    std::vector<std::vector<std::string> > n_;
    bool t;
};

enum error_id {
    INIT_ID = 0,
    LEXICAL_CHARACTER_DONT_FOUND = 1,
    SEMANTIC_CHARACTER_ILLEGAL = 2,
    SEMANTIC_OPERATOR_INCONSISTENT = 3,
    SEMANTIC_WRITE_FUNC = 4,
    SEMANTIC_WRITE_COND = 5,
    SEMANTIC_OPERATOR_COND_PRECEDENCE = 6,
    SEMANTIC_EXPRESSION_CRITICAL_ERROR = 7,
    SEMANTIC_EXPRESSION_USED_IN_FUNCTION = 8,
    SEMANTIC_FUNCTION_UNDEFINED = 9,
    SEMANTIC_FUNCTION_PARAMENTER_CRITICAL_ERROR = 10,
    SEMANTIC_VARIABLE_ERROR_NAME = 11,
    SEMANTIC_FUNC_ERROR_NAME = 12,
    COMPILER_VARIABLE_DONT_FOUND = 13,
    COMPILER_VARIABLE_TYPE_ERROR = 14,
    COMPILER_CONDITION_VARIABLE_DONT_FOUND = 15,
    ABSTRACT_COMMAND_DONT_FOUND = 16,
    ALLOC_STR_FAIL = 17,
    MACRO_ERROR = 18

};

struct st_ {
    bool _;
    error_id error;
    int l;
};

std::string secure_string_format(std::string s);
void error(st_ st);
void error_(const char* s, const char* ex_, int i, error_id error__);
bool is_operator(std::string c, std::string op_[len_op]);
char* int_to_string(int n);
int get_pr_str(std::string s);
bool is_prec_value(std::string s);
bool is_precedence_value(std::string s);
int get_pr_str_value(std::string s);
bool __str(std::string expression, char char_ign[ig__][2]);
bool is_correct_var_name(std::string s, char sym_[__symb][2], std::string operators[len_op]);
std::string get__file(std::string name);
std::string getFile__(std::string name);
void magenta_run(std::string name, std::string code);
//bool is__buffer(std::string str);
//int get__buffer(std::string str);
#endif
