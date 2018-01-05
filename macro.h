#include <string>
#include <iostream>
#include <vector>
#include <algorithm>
#include <functional>
#include <map>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "magenta_header.h"

#ifndef MACRO_H
#define MACRO_H

typedef struct {
	std::string obj;
	std::vector<std::string> s_objs;
	std::map<std::string, std::vector<std::string>> rule;
	std::string r_;
} mac_;

class macro {
	public:
	std::string input, code_x;	

	std::string __macro(std::string s, const char* abstract_logic[__abs][2], char char_ign[ig__][2], std::string operators[len_op], std::string cond_ex[_cond_p]); 
	std::vector<std::string> macro_reseverd = {"top", "down", "vars", "return", "macro"};
	std::vector<std::string> s_r = {"define", "macro", "macro-syntax", "end macro"};
	std::vector<std::string> f_ = {"var"};
	std::vector<std::string> syntax_r = {"{", "}", "$", "."};
	std::string g_syntax(std::string t, const char* abstract_logic[__abs][2]);
	std::tuple<int, int> mac_p(std::string s, const char* abstract_logic[__abs][2]);
	std::tuple<std::string, std::string> g_macro(std::string _, const char* abstract_logic[__abs][2]);
	
	std::string load(const char* abstract_logic[__abs][2], char char_ign[ig__][2], std::string operators[len_op], std::string cond_ex[_cond_p]);
	std::vector<std::string> tok(std::string str, const char* abstract_logic[__abs][2]);
	std::map<std::string, std::vector<std::string>> macr_c(std::string macrs_, char char_ign[ig__][2]);
	std::tuple<bool, std::map<std::string, std::string>, int> is_mac(std::vector<std::string> t, std::string _, char char_ign[ig__][2]);
	std::string _macro(std::string __, std::vector<std::string> tok, char char_ign[ig__][2], std::map<std::string, std::vector<std::string>>, const char* abstract_logic[__abs][2]);
	std::tuple<std::string, int> rule_macr(std::string __, int _, int p_, std::map<std::string, std::string> var_context, std::map<std::string, std::vector<std::string>> map_, char char_ign[ig__][2], const char* abstract_logic[__abs][2]);
    std::tuple<std::string, std::string> var__macro(std::string t, char char_ign[ig__][2]);
	private:
	std::vector<mac_> macro_;
	std::vector<std::string> vars;

};

#endif
