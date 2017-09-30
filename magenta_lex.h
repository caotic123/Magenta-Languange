#include <string>
#include <vector>
#include <string.h>
#include <sstream>

#define __symb 16
#define __abs 8
#define ig__ 3 
#define len_op 6

#ifndef MAGENTA_LEX_H
#define MAGENTA_LEX_H

typedef std::vector<std::string> token;

enum error_id {
INIT_ID = 0,
LEXICAL_CHARACTER_DONT_FOUND = 1,
SEMANTIC_CHARACTER_ILLEGAL = 2,
SEMANTIC_OPERATOR_INCONSISTENT = 3,
SEMANTIC_WRITE_FUNC = 4
};

struct st_ {
	bool _;
	error_id error;
	int l;
};

char* c(char* y, int t, int a);

class lex_ {
	
	public:	
	const char* abstract_logic[__abs][2] = {{"function", ") "}, {"if", " "}, {"while", " "}, {"ret", " "}, {"else", " "}, {"#", " "}, {"end", " "}, {"func", " "}}; //only one character [x] of abstract_logic[__abs][x]
    char char_ign[ig__][2] =  { {'\"', '\"'}, {'(', ')'}, {'[', ']'}}; // warning precedence order
    std::string operators[len_op] = {"+", "-", "*", "/", "%", ","}; // operators list expect "," but this is interpreter like this
	void lex__(std::string x_);
	std::string l__(std::string str, std::string sep, std::string sep_);
    st_ check__();
    void _token___(char* str);
    std::vector<std::string> get__token_();
    std::vector<std::string> get__exp();
    
	private:
	char* __input;
	char sym_[__symb][2] = {{0, 0}, {92, 122}, {65, 90}, {'+', 0}, {'-', 0}, {'/', 0}, {'*', 0}, {'%', 0}, {34, 35}, {60, 62}, 
	{32, 0}, {91, 0}, {93, 0}, {44, 0}, {40, 41}, {48, 57}};
	token n__;
	token token_lex; 
};

#endif
