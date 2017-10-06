#include "module.h"
#include "module_utility.h"

magneta_module::magneta_module()
{
    q = 0, q__ = 0;
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

int magneta_module::create_int_func(std::string func, args arg, blocks* b_)
{
    std::get<0>(___funcs[func]).n = func;
    std::get<0>(___funcs[func]).type = "i32"; // so... basically this function this a standard return type int of mangeta
    std::get<0>(___funcs[func]).__ = "ssp";
    std::get<0>(___funcs[func]).e_ = (char*)malloc(sizeof(char) * 3);
    std::get<0>(___funcs[func]).e_[0] = '{';
    std::get<0>(___funcs[func]).e_[1] = '}';

    std::get<1>(___funcs[func]).push_front(b_->get());

    for (args::iterator i__ = arg.begin(); i__ != arg.end(); ++i__) {
        std::get<0>(___funcs[func]).arg__.push_back((*i__));
    }

    return q;
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

    x__.insert_t(3, "ssp", "{", "\n");

    return x__.string();
}

void magneta_module::end_func(std::string &x_)
{
	x_ = x_ + "}" + "\n";
    return;
}

blocks* magneta_module::create_block(magneta_module* module, std::string name)
{
    blocks* b_ = new blocks(module->q, name);
    _blocks[module->q] = b_;
    module->q = module->q + 1;
    return _blocks[module->q - 1];
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

void blocks::create_integer_pointer_i32(const char* variable_name, int32_t value_)
{
    __code x_;
    x_.insert("%");
    x_.insert_t(3, variable_name, "=", "alloca i32");
    insert(x_.string());
    x_.__end();
    x_.insert_t(2, "store", "i32");
    x_.insert_int_32(" ", 1, value_);
    x_.insert(", ", true);
    x_.insert_t(2, "i32", ((std::string) "%" + (std::string)variable_name).c_str());
    insert(x_.string());
}

void magneta_module::create_variable_bool(std::string& cod__, std::string variable_name, bool t)
{
    __code x_;
    x_.insert("%");
    x_.insert_t(3, variable_name.c_str(), "=", "alloca i8");
    x_.s_();
    x_.insert_t(2, "store", "i8");
    x_.insert((t == true ? "1" : "0"));
    x_.insert(", ");
    x_.insert_t(2, "i8*", ((std::string) "%" + variable_name).c_str());
    x_.s_();
    
    cod__ = cod__ + x_.string();
}

std::string blocks::to_code()
{
    __code x_;
    for (std::vector<std::string>::iterator it = _m.begin(); it != _m.end(); ++it) {
        x_.insert((*it));
        x_.insert("\n");
    }
    return x_.string();
}

std::string magneta_module::generate__function__explicit_code(std::string func)
{
    __code x_;
    std::list<int> list_ = std::get<1>(___funcs[func]);
    args x__ = std::get<0>(___funcs[func]).arg__;
    x_.insert_t(2, "define", std::get<0>(___funcs[func]).type.c_str());
    x_.insert("@");
    x_.insert(std::get<0>(___funcs[func]).n);
    x_.insert("(");
    for (args::iterator i__ = x__.begin(); i__ != x__.end(); ++i__) {
        x_.insert(args_tostring((*i__)));
        x_.insert((i__ + 1) == x__.end() ? "" : ", ");
    }

    x_.insert(")");
    x_.insert(std::get<0>(___funcs[func]).e_[0]);
    x_.s_();
    for (std::list<int>::iterator i_ = list_.begin(); i_ != list_.end(); ++i_) {
        x_.insert(_blocks[(*i_)]->to_code());
    }
    x_.insert(std::get<0>(___funcs[func]).e_[1]);
    return x_.string();
}

