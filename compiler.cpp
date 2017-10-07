#include "compiler.h"

magenta_compiler::magenta_compiler() {
	module = new magneta_module;
}

std::string fix_arg(std::string str, char char_ign[ig__][2]) {
	std::string s;
	std::string s_;
	s = char_ign[1][0];
	s_ = char_ign[1][1];
	
	if (str.substr(0, 1) == s && str.substr(str.length()-1, 1) == s_) {
		return str.substr(1, str.length()-2);
	}

	return str;
}

void magenta_compiler::create_function(std::string name) {
	func_ f;
    std::map<std::string, func_*>::iterator func__i = func_map.find(name);
    if (func__i != func_map.end()) {
    	error_(name.c_str(), "redeclaration of function", 0, SEMANTIC_FUNC_ERROR_NAME);
	}

	f.func_name = name;
	f.q = new int;
	(*f.q) = 0;
	func_s.push_back(f);
	func_map[name] = &func_s[func_s.size()-1];
}

void magenta_compiler::create_label(std::string name_l) {
	func_* func__ = get_func();
	command_ label_;
	label_.command_name = name_l;
	label_.x_ = LABEL_NEW; 
	func__->block_.push_back(label_);
}

bool __is_bool(std::string value) {
	return (value == "true" || value == "false" ? 1 : 0);
}

std::string get_value(std::string s, char char_ign[ig__][2]) {
  std::string c;
  std::string s_;
  std::size_t __ = s.find(char_ign[1][0]);
  
  s_ = char_ign[1][1];
  for(int _=s.length()-1; _ >= 0; _--) {
    c = s.substr(_, 1);
    if (c == s_)
    return s.substr(__+1, (_-__)-1);
  }
  
  return secure_string_format(s);
}

type_ getType(std::string ex_, char char_ign[ig__][2]) {
	std::string value = get_value(ex_, char_ign);
	if (__is_bool(value)) {
		return bool_type;
	}
	
	return unknow_type;
}

void magenta_compiler::create_var(std::string name, char char_ign[ig__][2], struct_ep s_) {
	func_* func__ = get_func();
	command_ label_;
	std::string value_ =  get_value(s_.s, char_ign);
	
	switch(getType(value_, char_ign)) {

	case bool_type:
		create_command(name, VARIABLE_DECLARATION_BOOL, value_, s_);
		break;

	default:
		break;

	};


}

void magenta_compiler::set_function_args(std::string arg_name, char char_ign[ig__][2]) {
	func_* func__ = get_func();
	func__->par__.push_back(fix_arg(arg_name, char_ign));
}

func_* magenta_compiler::get_func() {
	return &func_s[func_s.size()-1];
}

void magenta_compiler::create_command(std::string name, type_command type, std::string value, struct_ep s_) {
	command_ command;
	command.command_name = name;
	command.x_ = type;
	command.s_ = s_;
	command.value = value;

	get_func()->block_.push_back(command);
}

void magenta_compiler::compile() {
	std::string cod__;
	std::string c__;
	command_ c_;
	for(___funcs::iterator i_ = func_s.begin(); i_ != func_s.end(); i_++) {
		c__ = module->create_func((*i_).func_name, "i32", ((*i_).par__));
	    module->insert__to_code(cod__, c__);
	    	for(std::vector<command_>::iterator block = (*i_).block_.begin(); block != (*i_).block_.end(); block++) {	
		    c_ = (*block);
	          if (c_.x_ == LABEL_NEW) {
	          module->create_label(cod__, c_.command_name);
	        }
	          if (c_.x_ == VARIABLE_DECLARATION_BOOL) {
	          module->create_variable_bool(cod__, (*i_).q, c_.command_name, (c_.value == "true" ? true : false));
	        }
       }
      
    module->end_func(cod__);
   }

	std::cout << cod__ << std::endl;
}
