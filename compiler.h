#include <string>
#include <vector>
#include "magenta_header.h"
#include "module.h"
#include "magenta_lex.h"

#ifndef COMPILER_H
#define COMPILER_H

struct command_ {
	type_command x_;
	std::string command_name;
	struct_ep s_;
	std::string value;
	std::vector<std::string> __par;
	type_ type;
	int* len;
};

struct func_ {
	type_func type;
	std::string func_name;
	std::vector<std::string> par__;
	std::vector<command_> block_;
	std::map<std::string, command_> var_map; // it's a backup of first declaration of variable
	int* q;
	int* n;
	int* __e;
	int* par__arg_int;
	int* f_cond_;
	int* __l;
	std::vector<std::pair<int, int>> stack; // stack also saves the first position command of block
};

typedef std::vector<func_> ___funcs;

class magenta_compiler {
public:

magenta_compiler();
void create_function(std::string name);	
func_* get_func();
command_ create_command(std::string name, type_command type, std::string value, struct_ep s_, type_ __type);
void set_function_args(std::string arg_name, char char_ign[ig__][2]);
void create_label(std::string name_l);
bool create_ret(std::string v_, struct_ep s_, std::string operators[len_op], char char_ign[ig__][2]);
void create_var(std::string name, std::string operators[len_op], char char_ign[ig__][2], struct_ep s_);
void create_variable_string(std::string name,  std::string str__, char char_ign[ig__][2]);
void end_while_selection_();
bool create_condition(struct_ep c_, struct_ep s_, std::string opt, std::string operators[len_op], char char_ign[ig__][2]);
bool var_e(std::string name);
void load_expression(struct_ep s_, std::string operators[len_op], char char_ign[ig__][2]);
void create_call_func(std::string name, std::string value, std::vector<struct_ep>, std::string operators[len_op], char char_ign[ig__][2]);
void create_var_call_func(std::string name, std::string func_name, std::vector<struct_ep> s_, std::string operators[len_op], char char_ign[ig__][2]);
type_ getType(std::string ex_, struct_ep s_, char char_ign[ig__][2]);
void create_add_operation(std::string x, std::string y, struct_ep s_);
void create_sub_operation(std::string x, std::string y, struct_ep s_);
void create_div_operation(std::string x, std::string y, struct_ep s_);
void create_mul_operation(std::string x, std::string y, struct_ep s_);
void create_expression();
std::string is_value(std::string v_, type_ type, std::string operators[len_op], char char_ign[ig__][2]);
void end_selection_();
void compile();
void magenta_run(std::string code);

private:
magneta_module* module;
std::string __cod_e;
___funcs func_s;
std::map<std::string, func_*> func_map;
};

#endif
