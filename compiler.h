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
};

struct func_ {
	type_func type;
	std::string func_name;
	 std::vector<std::string> par__;
	std::vector<command_> block_;
};

typedef std::vector<func_> ___funcs;

class magenta_compiler {
public:

magenta_compiler();
void create_function(std::string name);	
func_* get_func();
void create_command(std::string name, type_command type, std::string value, struct_ep s_);
void set_function_args(std::string arg_name, char char_ign[ig__][2]);
void create_label(std::string name_l);
void create_var(std::string name, char char_ign[ig__][2], struct_ep s_);
void compile();

private:
magneta_module* module;
std::string __cod_e;
___funcs func_s;
};

#endif
