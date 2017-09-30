#include "magenta_.h"

void error(st_ st) {
	switch (st.error) {
	case LEXICAL_CHARACTER_DONT_FOUND:
		printf("Ilegal character used in line %d\n", st.l);
    default:
    	printf("A unknow error ocurred\n");
    }

system("pause");
exit(0);
}

void magenta::load__file(std::string name)  {
code__ = module->getFile__(name);
__token();
}

bool magenta::__func(std::string s) {
	if (s.substr(0, strlen(lex->abstract_logic[0][0])) == (std::string)lex->abstract_logic[0][0]) {
		return true;
	}
	return false;
}

void magenta::__analysis() {
	for (token::iterator token_ = token__.begin() ; token_ != token__.end(); ++token_) {
		if (__func(*token_)) {
			printf("%s\n", (*token_).c_str());
		}
	}
	
}

void magenta::__token() {
 lex->lex__(code__);
 st_ st = lex->check__();
 if (lex->check__()._) {
 	printf("Error ocurred\n");
 	error(st);
 }

token__ = lex->get__token_();
exp_ = lex->get__exp();
__analysis();

}
