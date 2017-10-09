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

std::string __bit_cast(__code& x_, std::string variable_name, std::string n_, std::string type_) {
   x_.insert("%" + variable_name);
   x_.insert_t(6, "=", "bitcast", (type_ + "*").c_str(), ("%"+n_).c_str(), "to", "i8*");
   x_.s_();
   return variable_name;
}

std::string return__bit_cast(__code& x_, std::string variable_name, std::string n_, std::string type_) {
   x_.insert("%" + variable_name);
   x_.insert_t(6, "=", "bitcast", "i8*", ("%"+n_).c_str(), "to", (type_ + "*").c_str());
   x_.s_();
   return variable_name;
}

char* __aloc(__code& x_, int* n_, const char* type_) {
    char* n =  int_to_string((*n_));
    x_.insert("%");
    x_.insert_t(4, n, "=", "alloca", type_);
    x_.s_();
	return n;
}

void __store(__code& x_, std::string n, std::string value_, const char* type_) {
    x_.insert_t(2, "store", type_);
    x_.insert(value_);
    x_.insert(", ");
    x_.insert_t(2,  (std::string(type_) + "*").c_str(), ((std::string) "%" + n).c_str());
    x_.s_();
}

void magneta_module::create_variable_bool(std::string& cod__, int* q_, std::string variable_name, bool t)
{
    __code x_;
    char* n = __aloc(x_, q_, (const char*)"i1");
    (*q_)++;
    __store(x_, n, (t ? "1" : "0"), "i1");
    __bit_cast(x_, variable_name, n, "i1");
    cod__ = cod__ + x_.string();
}

void magneta_module::change_variable_bool(std::string& cod__, int* q_, std::string variable_name, bool t)
{
    __code x_;
    char* s_ = int_to_string((*q_));
    return__bit_cast(x_, s_, variable_name, "i1");
    __store(x_, s_, (t ? "1" : "0"), "i1");
    (*q_)++;
    cod__ = cod__ + x_.string();
}

void magneta_module::add_value(std::string& cod__, std::string x, std::string y, int* q)
{
    __code x_;
    std::string __add;
    char* s_ = int_to_string((*q));
    char* _ = int_to_string(((*q)-1));
        std::cout << x << "-" << is_prec_value(x) << std::endl;
    //x = (is_prec_value(x)) ? ("%" + std::string(int_to_string(((*q)-1)-get_pr_str(x)))) : x;
   // y = (is_prec_value(y)) ? ("%" + std::string(int_to_string(((*q)-1)-get_pr_str(y)))) : y;
    __add = x;
    x_.insert("%");
    if (__add == "%auto") {
      __add = ("%" + std::string(_));
      std::cout << __add << std::endl;
	}
	
	if (is_precedence_value(x)) {
      __add = ("%" + std::string(_));
      std::cout << __add << std::endl;
	}

    x_.insert(s_);
    x_.insert_t(1, " =");
    
    x_.insert_t(3, "add", "i32", __add.c_str());
    x_.insert(", ", true);
    x_.insert(y);
    (*q)++;
    x_.s_();
    cod__ = cod__ + x_.string();
}

void magneta_module::mul_value(std::string& cod__, std::string x, std::string y, int* q)
{
    __code x_;
    std::string __add = x;
    char* s_ = int_to_string((*q));
    char* _ = int_to_string(((*q)-1));
  //  x = (is_prec_value(x)) ? ("%" + std::string(int_to_string(((*q)-1)-get_pr_str(x)))) : x;
    //y = (is_prec_value(y)) ? ("%" + std::string(int_to_string(((*q)-1)-get_pr_str(y)))) : y;

    x_.insert("%");
    if (__add == "%auto") {
      __add = ("%" + std::string(_));
      std::cout << __add << std::endl;
	}

    x_.insert(s_);
    x_.insert_t(1, " =");
    
    x_.insert_t(3, "mul", "i32", __add.c_str());
    x_.insert(", ", true);
    x_.insert(y);
    (*q)++;
    x_.s_();
    cod__ = cod__ + x_.string();
}
