#include <string>
#include <iostream>
#include <vector>
#include <algorithm>
#include <functional>
#include "magenta_header.h"

#ifndef MACRO_H
#define MACRO_H

typedef struct {
	std::string obj;
	std::vector<std::string> s_objs;
	std::vector<std::string> new_vars;
	std::vector<std::string> top_;
	std::vector<std::string> down_;
	std::string r_;
} mac_;

class macro {
	public:
	std::vector<std::string> macro_reseverd = {"top", "down", "vars", "return", "macro"};
	std::vector<std::string> s_r = {"define", "macro", "macro-syntax", "end macro"};
	std::string g_syntax(std::string t, const char* abstract_logic[__abs][2]);
	std::tuple<int, int> mac_p(std::string s, const char* abstract_logic[__abs][2]);
	std::tuple<std::string, std::string> g_macro(std::string _, const char* abstract_logic[__abs][2]);
	
	macro(std::string s, const char* abstract_logic[__abs][2], char char_ign[ig__][2], std::string operators[len_op], std::string cond_ex[_cond_p]);
	void load(const char* abstract_logic[__abs][2], char char_ign[ig__][2], std::string operators[len_op], std::string cond_ex[_cond_p]);
	std::vector<std::string> tok(std::string str, const char* abstract_logic[__abs][2]);
	

	private:
	std::string input, code_x;	
	std::vector<mac_> macro_;
};

#endif
