#include "module_utility.h"

arg_a* p__args(std::string name, type_ t) {
	arg_a* a__ = new arg_a;
	a__->arg = name;
	a__->type___ = t;
	return a__;
}

void push__args(args& t, arg_a ar) {
	t.push_back(ar);
	return;
}

std::string args_tostring(arg_a t_) {
	std::string x__;
	type_ type___ = t_.type___;
	x__ = (
	(type___) == 1 ? (std::string)"i8": 
	(type___) == 2 ? (std::string)"i16": 
	(type___) == 3 ? (std::string)"i32":
	(type___) == 4 ? (std::string)"i64": 
	(type___) == 5 ? (std::string)"___string___" : "");
	x__ = x__ + (std::string)" %" + t_.arg;
  return x__;
}
