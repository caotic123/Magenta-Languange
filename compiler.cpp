#include "compiler.h"

magenta_compiler::magenta_compiler() {
	module = new magneta_module;
}

void magenta_compiler::create_function(std::string name) {
	func_ f;
	f.func_name = name;
	func_s.push_back(f);
}

void magenta_compiler::create_label(std::string name_l) {
	func_* func__ = get_func();
	command_ label_;
	label_.command_name = name_l;
	label_.x_ = LABEL_NEW; 
	func__->block_.push_back(label_);
}

void magenta_compiler::set_function_args(std::string arg_name) {
	func_* func__ = get_func();
	func__->par__.push_back(arg_name);
}

func_* magenta_compiler::get_func() {
	return &func_s[func_s.size()-1];
}

void magenta_compiler::create_command(std::string name, type_command type, struct_ep s_) {
	command_ command;
	command.command_name = name;
	command.x_ = type;
	command.s_ = s_;
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
       }
      
    module->end_func(cod__);
   }

	std::cout << cod__ << std::endl;
}
