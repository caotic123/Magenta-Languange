#include <vector>
#include <string>

#define __symb 16
#define __abs 8
#define ig__ 3 
#define len_op 6
#define _cond_p 4

#ifndef MAGENTA_HEADER_H
#define MAGENTA_HEADER_H

enum type_{
unknow_type = 0,
int8_type = 1,
int16_type = 2,
int32_type = 3,
int64_type = 4,
string_type = 5,
bool_type = 6
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
	LABEL_GOTO  = 7,
    VARIABLE_CHANGE_BOOL = 8,
    OPERATION_ADD_VALUE = 9,
    OPERATION_MUL_VALUE = 10 
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
SEMANTIC_FUNC_ERROR_NAME = 12

};

struct st_ {
	bool _;
	error_id error;
	int l;
};


std::string secure_string_format(std::string s);
void error(st_ st);
void error_(const char *s, const char *ex_, int i, error_id error__);
bool is_operator(std::string c, std::string op_[len_op]);
char* int_to_string(int n);
int get_pr_str(std::string s);
bool is_prec_value(std::string s);
bool is_precedence_value(std::string s);
#endif
