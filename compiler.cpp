#include "compiler.h"

//remeber this

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
	f.n = new int;
	(*f.n) = 0;
	f.__e = new int;
	(*f.__e) = 0;
	f.par__arg_int = new int;
	(*f.par__arg_int) = 0;
	func_s.push_back(f);
	func_map[name] = &func_s[func_s.size()-1];
}

void magenta_compiler::create_label(std::string name_l) {
	func_* func__ = get_func();
	command_ label_;
	label_.command_name = name_l;
	label_.x_ = LABEL_NEW; 
	label_.len = new int;
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

type_ magenta_compiler::getType(std::string ex_, struct_ep s_, char char_ign[ig__][2]) {
	func_* f = get_func();
	std::string value = get_value(ex_, char_ign);
	if (__is_bool(value)) {
		return bool_type;
	}
	if (s_.n_.size() > 1 || s_.n_[0].size() > 1) {
		return int32_expression;
	}
	
	if (value == "0" || strtol(value.c_str(), NULL, 10) != 0 || var_e(value)) {
		return int32_type;
    }
    
    if (__str(value, char_ign)) {
    	return string_type;
	}
    
    //case don't be nothing of the condition
	
	return unknow_type;
}

void magenta_compiler::create_add_operation(std::string x, std::string y, struct_ep s_) { //return variable reference operation
func_* f__ = get_func();
create_command(x, OPERATION_ADD_VALUE, y, s_, unknow_type);
return;
}

void magenta_compiler::create_sub_operation(std::string x, std::string y, struct_ep s_) { //return variable reference operation
func_* f__ = get_func();
create_command(x, OPERATION_SUB_VALUE, y, s_, unknow_type);
return;
}

void magenta_compiler::create_div_operation(std::string x, std::string y, struct_ep s_) { //return variable reference operation
func_* f__ = get_func();
create_command(x, OPERATION_DIV_VALUE, y, s_, unknow_type);
return;
}

void magenta_compiler::create_mul_operation(std::string x, std::string y, struct_ep s_) { //return variable reference operation
func_* f__ = get_func();
create_command(x, OPERATION_MUL_VALUE, y, s_, unknow_type);
return;
}

std::string magenta_compiler::is_value(std::string v_, type_ type, std::string operators[len_op], char char_ign[ig__][2]) {
	struct_ep s_; //empyth 
	s_.t = true;
	type_ type_cmp;
	func_* f = get_func();
	v_ = secure_string_format(v_);
	
	if (v_ != "0" && v_ != "%auto" && !is_prec_value(v_) && strtol(v_.c_str(), NULL, 10) == 0) {
	std::map<std::string, command_>::iterator var__ = f->var_map.find(v_);
    if (var__ == f->var_map.end()) {
      error_(v_.c_str(), "variable don't declared", 0, COMPILER_VARIABLE_DONT_FOUND);
	 }

	type_cmp = f->var_map[v_].type;
	
	if (type_cmp != unknow_type && type != type_cmp) {
		std::cout << type << " " << type_cmp << std::endl;
		error_(v_.c_str(), "variable types don't correspond", 0, COMPILER_VARIABLE_TYPE_ERROR);
	}

		switch(type) {

		case int32_type:
		    create_command("load value", LOAD_VALUE_BITCAST, v_, s_, unknow_type);
		     return "%" + v_;
		
	    case bool_type:
	    	create_command("load value", LOAD_VALUE_BOOL_BITCAST, v_, s_, unknow_type);
	    	return "%" + v_;
	 };
	
	}
	

	return v_;
}

void magenta_compiler::load_expression(struct_ep s_, std::string operators[len_op], char char_ign[ig__][2]) {
	std::string token;
	std::string p;
	std::vector<std::string> token__back;
	create_expression();
	for (std::vector<std::vector<std::string> >::iterator i = s_.n_.begin(); i != s_.n_.end(); i++) {
		p = ((*i)[0]);
		for (std::vector<std::string>::iterator __i = (*i).begin(); __i != (*i).end(); __i++) {	
		token = (*__i);
		if (token == operators[0]) {
			create_add_operation(is_value(p, int32_type, operators, char_ign) , is_value(*(__i+1), int32_type, operators, char_ign), s_);
			p = ("%" + std::string("auto"));
		}
		if (token == operators[1]) {
			create_sub_operation(is_value(p, int32_type, operators, char_ign), is_value(*(__i+1), int32_type, operators, char_ign), s_);
			p = ("%" + std::string("auto"));
		}
		if (token == operators[2]) {
			create_mul_operation(is_value(p, int32_type, operators, char_ign), is_value(*(__i+1), int32_type, operators, char_ign), s_);
			p = ("%" + std::string("auto"));
		}
		if (token == operators[3]) {
			create_div_operation(is_value(p, int32_type, operators, char_ign), is_value(*(__i+1), int32_type, operators, char_ign), s_);
			p = ("%" + std::string("auto"));
		}
	}
   }

}

bool magenta_compiler::var_e(std::string name) {
	func_* func__ = get_func();
	std::map<std::string, command_>::iterator var__i = func__->var_map.find(name);
    if (var__i != (func__->var_map.end())) {
    	return true;
    }

    return false;
}

void magenta_compiler::create_var_call_func(std::string name, std::string func_name, std::vector<struct_ep> s_, std::string operators[len_op], char char_ign[ig__][2]) 
{
	func_* f = get_func();
	std::string name_ = (func_name + int_to_string(*f->par__arg_int));
	
	create_call_func(func_name, name, s_, operators, char_ign);
}

void magenta_compiler::create_call_func(std::string name, std::string value, std::vector<struct_ep> s_, std::string operators[len_op], char char_ign[ig__][2]) {
  func_* f = get_func();
  std::vector<std::string> par__;
  std::string var_;
  command_ command;
  command_ var__f;
  command.command_name = name;
  command.x_ = CALL_FUNC;
  var__f.command_name = value;
  var__f.value = name;
  var__f.type = unknow_type;
  if (value != "call func") {
  	f->var_map[value] = var__f; // variables which recevied function values are untypeds
  }
  command.value = value;
  
  command.len = new int;
  for (std::vector<struct_ep>::iterator i_ = s_.begin(); i_ != s_.end(); i_++) {
       if ((var_e(fix_arg(get_value((*i_).s, char_ign), char_ign))) && f->var_map[fix_arg(get_value((*i_).s, char_ign), char_ign)].type == unknow_type) { // maybe be a paramater or other but don't be considered a typed value
       par__.push_back(fix_arg(get_value((*i_).s, char_ign), char_ign));
       } else {
  	   if (__str((*i_).s, char_ign) || (var_e(get_value((*i_).s, char_ign)) && f->var_map[get_value((*i_).s, char_ign)].type == string_type)) {
  	   	create_variable_string("par__" + std::string(int_to_string(*f->par__arg_int)), (*i_).s, char_ign);
  	   }
  	   else {
       create_var("par__" + std::string(int_to_string(*f->par__arg_int)), operators, char_ign,  (*i_));
       }
  	   par__.push_back("par__" + std::string(int_to_string(*f->par__arg_int)));
    }
       (*f->par__arg_int)++;
  }
  
  command.__par = par__;
  f->block_.push_back(command);
  par__.clear();
  
}

void magenta_compiler::create_var(std::string name, std::string operators[len_op], char char_ign[ig__][2], struct_ep s_) {
	func_* func__ = get_func();
	command_ label_;
	std::string value_ = get_value(s_.s, char_ign);
                                                                                    //ifs of captures types of declared variables, yes the order of conditionals is very important
        if (var_e(name) && func__->var_map[name].type == bool_type) {
    	      create_command(name, VARIABLE_CHANGE_BOOL, value_, s_, bool_type);
    	      return;
        }
        
        if (var_e(name) && getType(value_, s_, char_ign) == int32_expression) {
    	    	load_expression(s_, operators, char_ign);
    	    	create_command(name, CHANGE_VARIABLE_EXPRESSION, "exp", s_, int32_type);
    	    	return;
       }
       
       if (var_e(value_) && func__->var_map[value_].type == unknow_type) { // yes of value reference
       	        create_command(name, UNKNOW_TYPE_TO_POINTER, value_, s_, unknow_type);
       	        return;
	   }
	    
    	if (var_e(name) && getType(value_, s_, char_ign) == int32_type) {
    	    	create_command(name, VARIABLE_CHANGE_I32, is_value(value_, int32_type, operators, char_ign), s_, int32_type);
    	    	return;
        }

	
	switch(getType(value_, s_, char_ign)) {

	case bool_type:
		func__->var_map[name] = create_command(name, VARIABLE_DECLARATION_BOOL, value_, s_, bool_type);
		break;
	case int32_type:
		func__->var_map[name] = create_command(name, VARIABLE_DECLARATION_I32, is_value(value_, int32_type, operators, char_ign), s_, int32_type);
		break;
    case int32_expression:
    	load_expression(s_, operators, char_ign);
    	func__->var_map[name] = create_command(name, CREATE_VARIABLE_EXPRESSION, "exp", s_, int32_type);
    	break;

	default:
		break;

	};

}

void magenta_compiler::create_variable_string(std::string name,  std::string str__, char char_ign[ig__][2]) {
func_* func__ = get_func();
struct_ep s_;
s_.t = true;

if (var_e(name)) {
	create_command(name, CHANGE_STRING_VAR, str__, s_, unknow_type);
	return;
}

func__->var_map[name] = create_command(name, DECLARATION_STRING_VAR, str__, s_, string_type);
}

void magenta_compiler::set_function_args(std::string arg_name, char char_ign[ig__][2]) {
	func_* func__ = get_func();
	command_ command;
	command.command_name = "args";
	command.value = "arg__";
	command.type = unknow_type;
	func__->var_map[fix_arg(arg_name, char_ign)] = command;
	func__->par__.push_back(fix_arg(arg_name, char_ign));
}

func_* magenta_compiler::get_func() {
	return &func_s[func_s.size()-1];
}

void magenta_compiler::create_expression() {
	command_ command;
	command.command_name = "new exp";
	command.len = new int;
	command.x_ = NEW_EXPRESSION;

	get_func()->block_.push_back(command);
}

command_ magenta_compiler::create_command(std::string name, type_command type, std::string value, struct_ep s_, type_ __type) {
	command_ command;
	command.command_name = name;
	command.x_ = type;
	command.s_ = s_;
	command.value = value;
	command.len = new int;
    command.type = __type;

	get_func()->block_.push_back(command);
	return get_func()->block_[get_func()->block_.size()-1];
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
	          if (c_.x_ == CREATE_I8_VAR) {
	          module->create_unknowtype_var(cod__, c_.command_name, c_.value, (*i_).q);
	        }
	          if (c_.x_ == VARIABLE_DECLARATION_BOOL) {
	          module->create_variable_bool(cod__, (*i_).q, (*i_).__e, c_.command_name, (c_.value == "true" ? true : false));
	        }
	          if (c_.x_ == VARIABLE_DECLARATION_I32) {
	          module->create_variable_int32(cod__, c_.command_name, c_.value, (*i_).q, (*i_).__e);
	        }
	          if (c_.x_ == VARIABLE_CHANGE_I32) {
	          module->change_variable_int32(cod__, c_.command_name, c_.value, (*i_).q, (*i_).__e);
	        }
	          if (c_.x_ == VARIABLE_CHANGE_BOOL) {
	          module->change_variable_bool(cod__, (*i_).q, (*i_).__e, c_.command_name, (c_.value == "true" ? true : false));
	        }
	          if (c_.x_ == OPERATION_ADD_VALUE) {
	          module->add_value(cod__, c_.command_name, c_.value, (*i_).q, (*i_).n, (*i_).__e);
	        }
	          if (c_.x_ == OPERATION_SUB_VALUE) {
	          module->sub_value(cod__, c_.command_name, c_.value, (*i_).q, (*i_).n, (*i_).__e);
	        }
	          if (c_.x_ == OPERATION_DIV_VALUE) {
	          module->div_value(cod__, c_.command_name, c_.value, (*i_).q, (*i_).n, (*i_).__e);
	        }
	          if (c_.x_ == OPERATION_MUL_VALUE) {
	          module->mul_value(cod__, c_.command_name, c_.value, (*i_).q, (*i_).n, (*i_).__e);
	        }
	          if (c_.x_ == LOAD_VALUE_BITCAST) {
	          module->load_int_value(cod__, (*i_).__e, c_.value, c_.value);
	        }
	          if (c_.x_ == LOAD_VALUE_BOOL_BITCAST) {
	          module->load_bool_value(cod__, (*i_).__e, c_.value, c_.value);
	        }
	          if (c_.x_ == CREATE_VARIABLE_EXPRESSION) {
	          module->create_variable_expression_i32(cod__, c_.command_name, (*i_).q);
	        }
	          if (c_.x_ == CHANGE_VARIABLE_EXPRESSION) {
	          module->change_variable_expression_i32(cod__, c_.command_name, (*i_).q, (*i_).__e);
	        }
	          if (c_.x_ == DECLARATION_STRING_VAR) {
	          module->create_variable_str(cod__, c_.command_name, c_.value, (*i_).q);
	        }
	          if (c_.x_ == CHANGE_STRING_VAR) {
	          module->change_variable_str(cod__, c_.command_name, c_.value, (*i_).q);
	        }
	          if (c_.x_ == CALL_FUNC) {
	          module->create_call_func(cod__, c_.command_name, c_.__par, c_.value, (*i_).q);
	        }
	          if (c_.x_ == UNKNOW_TYPE_TO_POINTER) {
	          module->pointer_to_point(cod__, c_.command_name, c_.value, (*i_).q);
	        }
	          if (c_.x_ == NEW_EXPRESSION) {
	          	*(*i_).n = *(*i_).q;
	        }
       }
      
    module->end_func(cod__);
   }

	std::cout << cod__ << std::endl;
}