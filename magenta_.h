#include <vector>
#include <string>
#include "module.h"
#include "magenta_lex.h"
#include "module_utility.h"

#ifndef MAGENTA_H
#define MAGENTA_H

class magenta {
public:
magenta() {
lex = new lex_();
module = new magneta_module();
}

void __tok(std::string __o);
void load__file(std::string name);
void __analysis();

private:
	lex_* lex;
	magneta_module* module;
	token token__;
	std::vector<std::string> exp_;
	void analy__args(char* s);
	std::string code__;
	void __token();
	bool __func(std::string s);
};

#endif
