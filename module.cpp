#include "module.h"

magneta_module::magneta_module()
{

}

void magneta_module::insert__to_code(std::string& x_, std::string c_) {
	x_ = x_ + "\n" + c_;
	return;
}

std::string magneta_module::create_func(std::string func_, std::string type, std::vector<std::string> p__)
{
    __code x__;
	x__.insert_t(2, "define", type.c_str()),
	x__.insert("@");
	x__.insert_t(1, func_.c_str());
	x__.insert("(", true);
	for (std::vector<std::string>::iterator i = p__.begin(); i != p__.end(); i++) {
	x__.insert("i8* %");
	x__.insert((*i));
	x__.insert((i+1 == p__.end() ? "" : ", " ));
	}
	x__.insert(") ");

    x__.insert_t(2, "ssp", "{");
    x__.s_();

    return x__.string();
}

void magneta_module::end_func(std::string &x_, bool is_main)
{
	__code x;
	if (is_main) {
	x.insert_t(3, "ret", "i32", "1");
    }
	x_ = x_ + x.string();
	x_ =  x_ + "\n" + "}" + "\n";
    return;
}

void create_lab(__code &x_, std::string label_name) {
	x_.s_();
    x_.insert(label_name.c_str());
    x_.insert(":");
    x_.s_();
}

void magneta_module::create_label(std::string& cod, std::string label)
{
    __code x_;
    create_lab(x_, label);
    cod = cod + x_.string();
    return;
}

std::string __bit_cast(__code& x_, std::string variable_name, std::string n, std::string type_) {
   x_.insert("%" + variable_name);
   x_.insert_t(6, " =", "bitcast", (type_ + "*").c_str(), ("%"+n).c_str(), "to", "i8*");
   x_.s_();
   return variable_name;
}

std::string return__bit_cast(__code& x_, std::string variable_name, std::string n_, std::string type_) {
   x_.insert("%" + variable_name);
   x_.insert_t(6, " =", "bitcast", "i8*", ("%"+n_).c_str(), "to", (type_ + "*").c_str());
   x_.s_();
   return variable_name;
}

std::string __aloc(__code& x_, int* n__, std::string type_) {
    std::string n =  int_to_string((*n__));
    x_.insert("%");
    x_.insert_t(4, n.c_str(), "=", "alloca", type_.c_str());
    x_.s_();
    
	return std::string(n);
}

std::string __aloc_n(__code& x_, std::string n__, std::string type_) {
    x_.insert("%");
    x_.insert_t(4, n__.c_str(), "=", "alloca", type_.c_str());
    x_.s_();
    
	return std::string(n__);
}

std::string __aloc_str(__code& x_, std::string n, std::string type_) {
    x_.insert("%");
    x_.insert_t(4, n.c_str(), "=", "alloca", type_.c_str());
    x_.s_();

	return std::string(n);
}

void __get_ptr(__code& x_, std::string n_, std::string vector_type, std::string var, std::string element) {
	x_.insert_t(4, n_.c_str(), "=", "getelementptr inbounds", vector_type.c_str());
	x_.insert(", ", true);
	x_.insert_t(2, (vector_type+"*").c_str(), var.c_str());
	x_.insert(", ", true);
	x_.insert("i64 0");
	x_.insert(", ");
	x_.insert(("i64 " + element).c_str());
	x_.s_();
}

void __store(__code& x_, std::string n, std::string value__, std::string type_) {
    x_.insert_t(2, "store", type_.c_str());
    x_.insert(value__);
    x_.insert(", ");
    x_.insert_t(2, (type_ + "*").c_str(), ("%" + n).c_str());
    x_.s_();
}

void __store_i8(__code& x_, std::string n, std::string value__) {
    x_.insert_t(2, "store", "i8*");
    x_.insert(value__);
    x_.insert(", ");
    x_.insert_t(2, "i8*", ("%" + n).c_str());
    x_.s_();
}

void magneta_module::create_unknowtype_var(std::string& cod__, std::string name, std::string ref, int* q) {
	__code x_;
	std::string __n_ = int_to_string((*q)-1);
	if (name != "%auto") {
		__n_ = ref;
	}
	
	std::string n__ = __aloc(x_, q, "i8");
	__store_i8(x_, n__, "%" + __n_);
	cod__ = cod__ + x_.string();
}

void magneta_module::create_variable_bool(std::string& cod__, int* q_, int* __e, std::string variable_name, bool t)
{
    __code x_;
    if (variable_name.substr(0, 1) == "%") {
        variable_name = ("%" + variable_name.substr(1, variable_name.length()-1) + int_to_string(*__e));
	}
	
    std::string n = __aloc(x_, q_, "i1");
    (*q_)++;
    __store(x_, n, (t ? "1" : "0"), (char*)"i1");
    __bit_cast(x_, variable_name, n, "i1");
    cod__ = cod__ + x_.string();
}

void magneta_module::alloc_variable_str(std::string& cod__, std::string name, std::string len, int* q_) {
	__code x_;
    std::string n =__aloc_str(x_, name + "_stored_str",  ("[" + len + " x " + "i8" + "]"));
    __get_ptr(x_, ("%" + name), ("[" + len + " x " + "i8" + "]"), ("%" + n).c_str(), int_to_string(0));
    cod__ = cod__ + x_.string();
}

void magneta_module::change_variable_str(std::string& cod__, std::string name, std::string str__, int* q_)
{
    __code x_;
    std::string n__;
    int i;
    int len_ = (str__.length())-1;
    std::string len = int_to_string(str__.length());
    std::string type__ = ("[" + len + " x " + "i8" + "]");
    std::string n =  name + "_stored_str";

    for (i=0; i <= len_-2; i++) {
    n__ = (int_to_string(*q_));
    __get_ptr(x_, ("%" + n__), type__, ("%" + n).c_str(), int_to_string(i)); 
    __store(x_, n__, int_to_string((int)str__[i+1]), (char*)"i8");
    (*q_)++;
    }

    n__ = (int_to_string(*q_));
    __get_ptr(x_, ("%" + n__), type__, ("%" + n).c_str(), int_to_string(i)); 
    __store(x_, n__, int_to_string(0), (char*)"i8");
    (*q_)++;

    cod__ = cod__ + x_.string();
}

void magneta_module::create_variable_str(std::string& cod__, std::string name, std::string str__, int* q_)
{
    __code x_;
    std::string n__;
    int len_ = str__.length()-1;
    int i;
    std::string len = int_to_string(str__.length()+1);
    std::string type__ = ("[" + len + " x " + "i8" + "]");
    std::string n = __aloc_str(x_, name + "_stored_str",  type__);
    __get_ptr(x_, ("%" + name), type__, ("%" + n).c_str(), int_to_string(0)); 
    __store(x_, name, int_to_string((int)str__[1]), (char*)"i8");
    
    for (i=1; i <= len_-2; i++) {
    n__ = (int_to_string(*q_));
    __get_ptr(x_, ("%" + n__), type__, ("%" + n).c_str(), int_to_string(i)); 
    __store(x_, n__, int_to_string((int)str__[i+1]), (char*)"i8");
    (*q_)++;
    }

    n__ = (int_to_string(*q_));
    __get_ptr(x_, ("%" + n__), type__, ("%" + n).c_str(), int_to_string(i)); 
    __store(x_, n__, "0", (char*)"i8");
    (*q_)++;

    cod__ = cod__ + x_.string();
}

void magneta_module::load_value(__code& x, std::string name, std::string v, std::string type_) {
	x.insert_t(2, ("%"+name).c_str(), "=");
	x.insert_t(2, "load", type_.c_str());
    x.insert(", ", true);
    x.insert_t(2, (type_+"*").c_str(), ("%" + v).c_str());
    x.s_();
}

void create_continue_label(__code& x_, int* q, int * __l, std::vector<std::pair<int, int > >& __stack) {
	std::string label;
	std::string _n = int_to_string((*q)-1);
	std::string n_ = int_to_string(*__l);
	std::string n__ = int_to_string((*__l)+1);
	std::pair<int, int> x__n;
	std::get<1>(x__n) = (*__l)+1;
	x_.insert_t(3, "br", "i1", ("%" + _n).c_str());
	x_.insert(", ", true);
	x_.insert(("label %label_." + n_).c_str());
	x_.insert(", ");
	x_.insert(("label %label_." +  n__).c_str());
	x_.s_();
	create_lab(x_, "label_." + n_);
	(*__l)++;
	__stack.push_back(x__n);
}

std::string magneta_module::cond__if(__code& x, std::string cond_1, std::string cond_2, std::string type, std::string op, int* q, int* __e) {
	std::string n;
	std::string vr = "";
	std::string _n;
	std::string __n;
	n = int_to_string(*q);
	x.insert("%");
	x.insert_t(6, n.c_str(), "=", "icmp", op.c_str(), type.c_str(), ("%" + cond_1).c_str());
	x.insert(", ", true);
	x.insert(("%" + cond_2).c_str());
	x.s_();
	(*q)++;
	(*__e) = (*q); // its not necessary but...
	return n;
}

void magneta_module::end_selection(std::string& cod__, int* __l, std::vector<std::pair<int, int > >& __stack) {
	__code x_;
	std::pair <int, int> x__ = *(__stack.end()-1);
	x_.insert_t(3, "br", "label", ((std::string)"%" + (std::string)"label_." + int_to_string(std::get<1>(x__))).c_str());
	x_.s_();
    create_lab(x_, "label_." + std::string(int_to_string(std::get<1>(x__)))); // the last selection opened	
    __stack.erase(__stack.end()-1);
    cod__ = cod__ + x_.string();
}

void magneta_module::while_selection(std::string& cod__, int* __l, std::vector<std::pair<int, int > >& __stack) {
	__code x_;
	std::pair <int, int> x__ = *(__stack.end()-1);
	x_.insert_t(2, "br i1",  ("%" + std::string(int_to_string((std::get<0>(x__))))).c_str());
	x_.insert(", ", true);
	x_.insert("label %label_." +  std::string(int_to_string((*__l)-1)));
	x_.insert(", ");
	x_.insert(("label %label_." + std::string(int_to_string((std::get<1>(x__))))).c_str());
	x_.s_();
    create_lab(x_, "label_." + std::string(int_to_string(std::get<1>(x__)))); // the last selection opened	
    __stack.erase(__stack.end()-1);
    cod__ = cod__ + x_.string();
}

std::string re_load(__code& x, int* q, std::string bit_name, std::string type_) {
	std::string _ = std::string(int_to_string(*q));
	x.insert_t(2, ("%" +_).c_str(), "=");
	x.insert_t(2, "load", type_.c_str());
    x.insert(", ", true);
    x.insert_t(2, (type_+"*").c_str(), ("%" +  ("bit_" + bit_name)).c_str());
    (*q)++;
    x.s_();
    return _;
}

void magneta_module::create_return_function(std::string& cod__, std::string v_) {
	__code x_;
	x_.insert_t(3, "ret", "i8*", ("%" + v_).c_str());
	cod__ = cod__ + x_.string();
}

void magneta_module::create_if_condition(std::string& cod__, type_ type, std::string op, std::vector<std::string> __cond, int* q, int* __e, int* __l, std::vector<std::pair<int, int > >& __stack) {
	__code x_;
	std::string operator_;
	std::string type__;
	if (op == "==") {
		operator_ = "eq";
	}
	if (op == "!=") {
		operator_ = "ne";
	}
	if (op == ">") {
		operator_ = "sgt";
    }
	if (op == "<") {
		operator_ = "slt";
    }
	if (op == ">=") {
		operator_ = "sge";
    }
	if (op == "<=") {
		operator_ = "sle";
    }
	
	if (type == int32_type) {
		type__ = "i32";
	}

	if (type == bool_type) {
		type__ = "i1";
	}
	
	std::string n = cond__if(x_, __cond[0], __cond[1], type__, operator_, q, __e);
	create_continue_label(x_, q, __l, __stack);

	cond__if(x_, re_load(x_, q, __cond[0], type__), re_load(x_, q, __cond[1], type__), type__, operator_, q, __e); //second condition to eventual loop
	std::get<0>(*(__stack.end()-1)) = (*q)-1;
	cod__ = cod__ + x_.string();
}

void magneta_module::pointer_to_point(std::string& cod, std::string name, std::string v, int* q) {
	__code x_;
	std::string n_ = __aloc(x_, q, "i8*");
	__store(x_, n_.c_str(), ("%" + v).c_str(), "i8*");
    load_value(x_, name, n_, "i8*");
    (*q)++;
	cod = cod + x_.string();
}

void magneta_module::create_variable_expression_i32(std::string& cod__, std::string var_, int* q_)
{
    __code x_;
    std::string s_ = ("%" + std::string(int_to_string((*q_)-1)));
    std::string __n = __aloc(x_, q_, "i32");
    (*q_)++;
    __store(x_, __n, s_, (char*)"i32");
    __bit_cast(x_, var_, __n, "i32");
    cod__ = cod__ + x_.string();
}

void magneta_module::create_variable_int32(std::string& cod__, std::string name, std::string var, int* q_, int*e)
{
    __code x_;
    if (var.substr(0, 1) == "%") {
      var = ("%" + var.substr(1, var.length()-1) + int_to_string(*e));
	}
	
    std::string __n = __aloc(x_, q_, "i32");
    (*q_)++;
    (*e) = (*q_);
    __store(x_, __n, var, (char*)"i32");
    __bit_cast(x_, name, __n, "i32");
    cod__ = cod__ + x_.string();
}

void magneta_module::change_variable_int32(std::string& cod__, std::string name, std::string var, int* q_, int* __e)
{
    __code x_;
    if (var.substr(0, 1) == "%") {
      var = ("%" + var.substr(1, var.length()-1) + int_to_string(*__e));
	}
	
    return__bit_cast(x_, int_to_string(*q_), name, "i32");
    __store(x_, int_to_string(*q_), var, (char*)"i32");
    (*q_)++;
    cod__ = cod__ + x_.string();
}

std::string magneta_module::load_int_value(std::string& cod__, int* __e, std::string name, std::string v_)
{
    __code x_;
    char* n = int_to_string((*__e));
    std::string _ = ("bit_" + name + std::string(n));
    std::string __ = (name + std::string(n));
    return__bit_cast(x_, _, v_, "i32");
    load_value(x_, __, _, "i32");
    cod__ = cod__ + x_.string();
    return __;
}

std::string magneta_module::load_int_value_cond(std::string& cod__, int* __e, std::string name, std::string v_)
{
    __code x_;
    char* n = int_to_string((*__e));
    std::string _ = ("bit_" + name);
    std::string __ = name ;
    return__bit_cast(x_, _, v_, "i32");
    load_value(x_, __, _, "i32");
    cod__ = cod__ + x_.string();
    return __;
}

std::string magneta_module::load_bool_value(std::string& cod__, int* __e, std::string name, std::string v_)
{
    __code x_;
    char* n = int_to_string((*__e));
    std::string _ = ("bit_" + name + std::string(n));
    std::string __ = (name + std::string(n));
    return__bit_cast(x_, _, v_, "i1");
    load_value(x_, __, _, "i1");
    cod__ = cod__ + x_.string();
    return __;
}

std::string magneta_module::load_bool_value_cond(std::string& cod__, int* __e, std::string name, std::string v_)
{
    __code x_;
    char* n = int_to_string((*__e));
    std::string _ = ("bit_" + name);
    std::string __ = name;
    return__bit_cast(x_, _, v_, "i1");
    load_value(x_, __, _, "i1");
    cod__ = cod__ + x_.string();
    return __;
}

void magneta_module::create_call_func(std::string& cod__, std::string func_name, std::vector<std::string> par__, std::string v_, int* q) {
	__code x_;
	std::string s_ = v_; 
	if (v_ == "%auto") {
		s_ = int_to_string((*q));
	}
	
	x_.insert_t(5, ("%" + s_).c_str(), "=", "call", "i8*", ("@" + func_name).c_str());
	x_.insert("(", true);
	
	for (std::vector<std::string>::iterator i = par__.begin(); i != par__.end(); i++) {
		x_.insert("i8* %");
		x_.insert((*i).c_str());
		x_.insert((i+1) == par__.end() ? "" : ", ");
	}
	x_.insert(")");
	x_.s_();
	
	if (v_ == "%auto") {
		(*q)++;
	}

	cod__ = cod__ + x_.string();
}

void magneta_module::change_variable_expression_i32(std::string& cod__, std::string var, int *q, int* __e)
{
    __code x_;
    std::string value___ = ("%" + std::string(int_to_string(((*q)-1)))).c_str();
    char* s_ = int_to_string((*q));
    if (var.substr(0, 1) == "%") {
      var = ("%" + var.substr(1, var.length()-1) + int_to_string(*__e));
	}
	
    return__bit_cast(x_, s_, var, (char*)"i32");
    __store(x_, s_, value___, (char*)"i32");
    (*q)++;
    cod__ = cod__ + x_.string();
}

void magneta_module::change_variable_bool(std::string& cod__, int* q_, int* __e, std::string variable_name, bool t)
{
    __code x_;
    char* s_ = int_to_string((*q_));
    if (variable_name.substr(0, 1) == "%") {
      variable_name = ("%" + variable_name.substr(1, variable_name.length()-1) + int_to_string(*__e));
	}

    return__bit_cast(x_, s_, variable_name, "i1");
    __store(x_, s_, (t ? "1" : "0"), (char*)"i1");
    (*q_)++;
    cod__ = cod__ + x_.string();
}

void magneta_module::add_value(std::string& cod__, std::string x, std::string y, int* q, int* n, int* __e)
{
    __code x_;
    std::string __add;
    char* s_ = int_to_string((*q));
    char* _ = int_to_string(((*q)-1));
    __add = x;
    x_.insert("%");

    if (__add.substr(0, 1) == "%" && __add != "%auto") {
      __add = ("%" + __add.substr(1, __add.length()-1) + int_to_string(*__e));
	}
	
	if (y.substr(0, 1) == "%") {
      y = ("%" + y.substr(1, y.length()-1) + int_to_string(*__e));
	}
	
    if (__add == "%auto") {
      __add = ("%" + std::string(_));
	}
	__add = (is_prec_value(__add)) ? ("%" + std::string(int_to_string((*n)+get_pr_str_value(__add)))) : __add;
    y = (is_prec_value(y)) ? ("%" + std::string(int_to_string((*n)+get_pr_str_value(y)))) : y;

    x_.insert(s_);
    x_.insert_t(1, " =");
    
    x_.insert_t(3, "add", "i32", __add.c_str());
    x_.insert(", ", true);
    x_.insert(y);
    (*q)++;
    (*__e) = (*q);
    x_.s_();
    cod__ = cod__ + x_.string();
}

void magneta_module::sub_value(std::string& cod__, std::string x, std::string y, int* q, int* n, int* __e)
{
    __code x_;
    std::string __add;
    char* s_ = int_to_string((*q));
    char* _ = int_to_string(((*q)-1));
    __add = x;
    x_.insert("%");

    if (__add.substr(0, 1) == "%" && __add != "%auto") {
      __add = ("%" + __add.substr(1, __add.length()-1) + int_to_string(*__e));
	}
	
	if (y.substr(0, 1) == "%") {
      y = ("%" + y.substr(1, y.length()-1) + int_to_string(*__e));
	}
	
    if (__add == "%auto") {
      __add = ("%" + std::string(_));
	}
	__add = (is_prec_value(__add)) ? ("%" + std::string(int_to_string((*n)+get_pr_str_value(__add)))) : __add;
    y = (is_prec_value(y)) ? ("%" + std::string(int_to_string((*n)+get_pr_str_value(y)))) : y;

    x_.insert(s_);
    x_.insert_t(1, " =");
    
    x_.insert_t(3, "sub", "i32", __add.c_str());
    x_.insert(", ", true);
    x_.insert(y);
    (*q)++;
    (*__e) = (*q);
    x_.s_();
    cod__ = cod__ + x_.string();
}

void magneta_module::div_value(std::string& cod__, std::string x, std::string y, int* q, int* n, int* __e)
{
    __code x_;
    std::string __add;
    char* s_ = int_to_string((*q));
    char* _ = int_to_string(((*q)-1));
    __add = x;
    x_.insert("%");

    if (__add.substr(0, 1) == "%" && __add != "%auto") {
      __add = ("%" + __add.substr(1, __add.length()-1) + int_to_string(*__e));
	}
	
	if (y.substr(0, 1) == "%") {
      y = ("%" + y.substr(1, y.length()-1) + int_to_string(*__e));
	}
	
    if (__add == "%auto") {
      __add = ("%" + std::string(_));
	}
	__add = (is_prec_value(__add)) ? ("%" + std::string(int_to_string((*n)+get_pr_str_value(__add)))) : __add;
    y = (is_prec_value(y)) ? ("%" + std::string(int_to_string((*n)+get_pr_str_value(y)))) : y;

    x_.insert(s_);
    x_.insert_t(1, " =");
    
    x_.insert_t(3, "udiv", "i32", __add.c_str());
    x_.insert(", ", true);
    x_.insert(y);
    (*q)++;
    (*__e) = (*q);
    x_.s_();
    cod__ = cod__ + x_.string();
}

void magneta_module::mul_value(std::string& cod__, std::string x, std::string y, int* q, int* n, int* __e)
{
    __code x_;
    std::string __add = x;
    char* s_ = int_to_string((*q));
    char* _ = int_to_string(((*q)-1));

    x_.insert("%");
    
    if (__add.substr(0, 1) == "%" && __add != "%auto") {
      __add = ("%" + __add.substr(1, __add.length()-1) + int_to_string(*__e));
	}
	
	if (y.substr(0, 1) == "%") {
      y = ("%" + y.substr(1, y.length()-1) + int_to_string(*__e));
	}
	
    if (__add == "%auto") {
      __add = ("%" + std::string(_));
	}
	
	__add = (is_prec_value(__add)) ? ("%" + std::string(int_to_string((*n)+get_pr_str_value(__add)))) : __add;
    y = (is_prec_value(y)) ? ("%" + std::string(int_to_string((*n)+get_pr_str_value(y)))) : y;

    x_.insert(s_);
    x_.insert_t(1, " =");
    
    x_.insert_t(3, "mul", "i32", __add.c_str());
    x_.insert(", ", true);
    x_.insert(y);
    (*q)++;
    (*__e) = (*q);
    x_.s_();
    cod__ = cod__ + x_.string();
}
