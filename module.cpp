#include "module.h"

magneta_module::magneta_module()
{

}

std::string magneta_module::getFile__(std::string name)
{
    int length;
    std::string buffer;
    std::string _cs;
    std::ifstream __f;
    __f.open(name + ".mag");
    if (!__f) {
        std::cout << "ERROR DON'T LOAD FILE CODE\n";
        system("pause");
        exit(EXIT_FAILURE);
    }

    if (__f.is_open()) {
        while (!__f.eof()) {
            getline(__f, buffer);
            _cs = _cs + buffer + " ";
        }
    }

    return _cs;
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

void magneta_module::end_func(std::string &x_)
{
	x_ = x_ + "}" + "\n";
    return;
}

void magneta_module::create_label(std::string& cod, std::string label)
{
    __code x_;
    x_.insert(label.c_str());
    x_.insert(":");
    x_.s_();
    cod = cod + x_.string();
    
    return;
}

std::string __bit_cast(__code& x_, std::string variable_name, std::string n, std::string type_) {
   x_.insert("%" + variable_name);
   x_.insert_t(6, "=", "bitcast", (type_ + "*").c_str(), ("%"+n).c_str(), "to", "i8*");
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

void magneta_module::create_variable_bool(std::string& cod__, int* q_, std::string variable_name, bool t)
{
    __code x_;
    std::string n = __aloc(x_, q_, "i1");
    (*q_)++;
    __store(x_, n, (t ? "1" : "0"), (char*)"i1");
    __bit_cast(x_, variable_name, n, "i1");
    cod__ = cod__ + x_.string();
}

void magneta_module::create_variable_str(std::string& cod__, std::string name, std::string str__, int* q_)
{
    __code x_;
    std::string n__;
    int len_ = str__.length()-1;
    std::string len = int_to_string(str__.length());
    std::string type__ = ("[" + len + " x " + "i8" + "]");
    std::string n = __aloc(x_, q_,  type__);
    (*q_)++;
    for (int i=0; i <= len_-2; i++) {
    n__ = (int_to_string(*q_));
    __get_ptr(x_, ("%" + n__), type__, ("%" + n).c_str(), int_to_string(i)); 
    __store(x_, n__, int_to_string((int)str__[i+1]), (char*)"i8");
    (*q_)++;
    }
    n__ = (int_to_string(*q_));
    __get_ptr(x_, ("%" + n__), type__, ("%" + n).c_str(), int_to_string(len_)); 
    __store(x_, n__, int_to_string(0), (char*)"i8");
    (*q_++);

    cod__ = cod__ + x_.string();
}

void magneta_module::load_value(__code& x, std::string name, std::string v, std::string type_) {
	x.insert_t(2, ("%"+name).c_str(), "=");
	x.insert_t(2, "load", type_.c_str());
    x.insert(", ", true);
    x.insert_t(2, (type_+"*").c_str(), ("%" + v).c_str());
    x.s_();
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

void magneta_module::load_int_value(std::string& cod__, int* __e, std::string name, std::string v_)
{
    __code x_;
    char* n = int_to_string((*__e));
    std::string _ = ("bit_" + name + std::string(n));
    std::string __ = (name + std::string(n));
    return__bit_cast(x_, _, v_, "i32");
    load_value(x_, __, _, "i32");
    cod__ = cod__ + x_.string();
}

void magneta_module::change_variable_expression_i32(std::string& cod__, std::string var, int *q)
{
    __code x_;
    char* value___ = (char*)("%" + std::string(int_to_string(((*q)-1)))).c_str();
    char* s_ = int_to_string((*q));
    return__bit_cast(x_, s_, var, (char*)"i32");
    __store(x_, s_, value___, (char*)"i32");
    (*q)++;
    cod__ = cod__ + x_.string();
}

void magneta_module::change_variable_bool(std::string& cod__, int* q_, std::string variable_name, bool t)
{
    __code x_;
    char* s_ = int_to_string((*q_));
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
