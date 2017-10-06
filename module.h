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

struct arg_a {
	type_ type___;
	std::string arg;
};

typedef std::vector<arg_a> args;

class __code {
	public:
	
	__code() {
     code = "";	
	}
    
    template<typename T>
	void insert(T x, bool p = false) {
		if (p) {
			code = code.substr(0, code.length()-1);
		}
		code = (std::string)code + x;
	}
	
	void insert_int_32(const char* del, int len,  ...) {
	int32_t val;
	char buffer[100];
	va_list __;
    va_start(__, len);
    for (int i=0;i<len;i++)
    {
    val=va_arg(__, int32_t);
    sprintf(buffer, "%d", val);
    code = code + std::string(buffer) + std::string(del);
    }
    va_end(__);
	}
	
	void insert_t(int len=1, ...) {
	const char* val;
	va_list __;
    va_start(__, len);
    for (int i=0;i<len;i++)
    {
    val=va_arg(__, const char*);
    code = code + val + " ";
    }
    va_end(__);
	}
	
	void __end() {
		code = "";
	}
	
	void s_() {code = code + "\n";}
	
	std::string string() {
		return code;
	}
	
	private:
	std::string code;
};

class blocks {
	public:
	blocks(int id, std::string name_) {
	__id = id;
	name = name_;
	}
	
	void insert(std::string n){	
	_m.push_back(n);
	}
	
	int get() {
	 return __id;	
	}

	void create_integer_pointer_i32(const char* variable_name, int32_t value_);
	std::string to_code();

	private:
	std::string name;
    std::vector<std::string> _m;
    int s;
    int __id;
};

struct func {
	std::string type;
	std::string n;
	std::string __;
	args arg__;
	char* e_;
};

class magneta_module {
	public:
    magneta_module();
	int create_int_func(std::string func, args arg, blocks* b_) ;
    int create_integer_pointer_i32(blocks* block_, std::string variable_name, int32_t value_);
	blocks* create_block(magneta_module * module, std::string name);
	std::string generate__function__explicit_code(std::string func);
	std::string getFile__(std::string name);
	void create_label(std::string& cod, std::string label);
	std::string create_func(std::string func, std::string type, std::vector<std::string> p__);
	void insert__to_code(std::string& x_, std::string c_);
	void end_func(std::string& x_);
	void create_variable_bool(std::string& cod__, std::string variable_name, bool t);
	
	private:
	std::map<std::string, std::pair<struct func, std::list<int> > > ___funcs;
	std::map<int, blocks*> _blocks;
	int q;
	int q__;
};

#endif
