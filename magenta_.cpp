#include "magenta_.h"

void error(st_ st) {
	switch (st.error) {
	case LEXICAL_CHARACTER_DONT_FOUND:
		printf("Illegal character: used in line %d\n", st.l);
		break;
	case SEMANTIC_CHARACTER_ILLEGAL:
		printf("Illegal expression: used illegal combination of characters in %d\n", st.l);
		break;
	case SEMANTIC_OPERATOR_INCONSISTENT:
		printf("Illegal expression: the use of the operator in this way is illegal %d\n", st.l);
		break;
	case SEMANTIC_WRITE_FUNC:
		printf("Illegal function: the use of the function in this way is illegal %d\n", st.l);
		break;
	case SEMANTIC_WRITE_COND:
		printf("Illegal condition: the use of the condition in this way is illegal %d\n", st.l);
		break;
	case SEMANTIC_OPERATOR_COND_PRECEDENCE:
		printf("Illegal condtion: check condition precedence %d\n", st.l);
		break;
    default:
    	printf("A unknow error ocurred\n");
    }

system("pause");
exit(0);
}

void error_(const char* s, const char* ex_, int i, error_id error__) {
	st_ st; 
	st.error = error__;
	st.l = i;
	st._ = true;
	printf("%s Incorret use of \"%s\"\n", s, ex_);
	error(st);
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

bool magenta::call__func(std::string s) {
	if (s.substr(0, strlen(lex->abstract_logic[7][0])) == (std::string)lex->abstract_logic[7][0] && s.substr(strlen(lex->abstract_logic[7][0]), 1) == " ") {
		return true;
	}
	return false;
}

bool magenta::__if(std::string s) {
	if (s.substr(0, strlen(lex->abstract_logic[1][0])) == (std::string)lex->abstract_logic[1][0]) {
		return true;
	}
	return false;
}

bool is_operator(std::string c, std::string op_[len_op]) {
  bool x=false;
  for(int i=0; i <= len_op; i++) {
    x = (op_[i] == c) ? true : x;
  }

  return x;
}

bool __str(std::string expression, char char_ign[ig__][2])
{
    int p = 0;
    std::string s;
	s = char_ign[1][0];

   if(expression.substr(0, 1) == s) {
     expression = expression.substr(1, expression.length()-2);
   }
    
    for (int i = 0; i <= expression.length() - 1; i++) {
        if (expression.substr(i, 1) == "\"") {
            p++;
        }
        if ((p >= 2 || p == 0) && expression.substr(i, 1) != "\"" && expression.substr(i, 1) != " ") {
            p = false;
            break;
        }
    }

    return p;
}

bool is_sep(char char_ign[ig__][2], std::string c) {
  bool x=false;
  std::string s, s_;
  for(int i=0; i <= ig__-1; i++) {
    s = char_ign[i][0];
    s_ = char_ign[i][1];
    x = (c == s || c == s_) ? true : x;
  }

  return x;
}

bool i_c_ex(std::string cond_ex[_cond_p], std::string c_) {
  bool b = false;
  for (int i=0; i <= 3; i++) {
    b = (c_ == cond_ex[i]) ? true : b;
  }
  return b;
}

int get_priority(std::string x_,  std::string cond_ex[_cond_p]) {
  bool b = false;
  for (int i=0; i <= 3; i++) {
    if (x_ == cond_ex[i]) {
      return i+1;
    }
  }
  
  return 0;
}

int* analyse_cond(std::string cond, std::string cond_ex[_cond_p]) {
  int* op = (int*)malloc(sizeof(int)*3);
  std::string c_;
  for (int i=0; i <= cond.length()-1; i++) {
    c_ = cond.substr(i, 1);
    if (i_c_ex(cond_ex, c_)) {
      if (c_ != cond_ex[0] && c_ != cond_ex[1] && !i_c_ex(cond_ex, cond.substr(i+1, 1))) {error_(cond.c_str(), c_.c_str(), i, SEMANTIC_WRITE_COND) ;}
      if (i_c_ex(cond_ex, cond.substr(i+1, 1)) && get_priority(c_, cond_ex) > get_priority(cond.substr(i+1, 1), cond_ex)) {
        error_(cond.c_str(), c_.c_str(), i,  SEMANTIC_OPERATOR_COND_PRECEDENCE);
      }
      if (!i_c_ex(cond_ex, cond.substr(i+1, 1)))
      {
      	op[0] = i-1;
      	op[1] = i+1;
	  }
	  else {
      op[0] = i-1;
      op[1] = i+2;
    }
    
      break;
    }
  }
  return op;
}

void analy_exp(char op[ig__][2], std::string op_[len_op], std::string str)
{
    std::string c;
    std::string s, x_;
    bool z__ = true;
    bool y__ = true;
    int p_ = 0;
    int q_;
    int i__;
    int i;
    for (i = 0; i <= str.length() - 1; i++) {
        c = str.substr(i, 1);
        s = op[1][0];
        x_ = op[1][1];
        p_ = (c == s) ? p_ + 1 : (c == x_) ? p_ - 1 : p_;

        if (c == " " && i < (str.length() - 1) && str.substr(i + 1, 1) != " " && i > 0 && str.substr(i - 1, 1) != " ") {
            z__ = true;
            for (i__ = i - 1; (i__ >= 0); i__--) {
                if (str.substr(i__, 1) != " ") {
                    z__ = is_operator(str.substr(i__, 1), op_) ? true : false;
                    break;
                }
            }

            for (i__ = i + 1; (i__ <= str.length() && !z__); i__++) {
                if (str.substr(i__, 1) != " ") {
                    z__ = is_operator(str.substr(i__, 1), op_) ? true : false;
                    break;
                }
            }
        }

        if (is_operator(c, op_)) {
            y__ = false;
            for (q_ = i + 1; q_ <= str.length() - 1; q_++) {
                if (str.substr(q_, 1) != " " && !is_sep(op, str.substr(q_, 1)) && !is_operator(str.substr(q_, 1), op_)) {
                    y__ = true;
                    break;
                }
            }
            for (q_ = i - 1; q_ >= 0 && y__; q_--) {
                if (str.substr(q_, 1) != " " && !is_sep(op, str.substr(q_, 1)) && !is_operator(str.substr(q_, 1), op_)) {
                    y__ = true;					   
                    break;
                }
            }
        }

        if (!z__ || !y__) {
            error_(str.c_str(), c.c_str(), i, SEMANTIC_OPERATOR_INCONSISTENT);
            return;
        }
    }

    if (p_ != 0) {
        error_(str.c_str(), (p_ > 0) ? ")" : "(", i, SEMANTIC_CHARACTER_ILLEGAL);
        return;
    }

    return;
}

int getn_expression(std::string str_) {
  std::string buf;
  std::size_t found = str_.find("(");
  str_ = str_.substr(found, str_.length()-found-1);
  buf = str_;
  if (found==std::string::npos) {
   error_(buf.c_str(), "?", 0, SEMANTIC_WRITE_FUNC);
  }

  buf = "";
  
  std::remove_copy(str_.begin(), str_.end(), std::back_inserter(buf), ' ');

  return atoi(buf.substr(1, buf.length()-2).c_str());
}

bool magenta::var_decl(std::string s) {
  std::string c,p;
  p = lex->abstract_logic[5][0];
  for (int i=0; i <= s.length()-1; i++) {
    c = s.substr(i, 1);
    if (c == p) {return true;}
    if (c != " " && c != p) {
      return false;
    }
  }
  return false;
}
  

std::string magenta::get_str_tok(int n) {
	return secure_string_format(exp_[n]);
}

std::string get_t(std::string str, int p, int x) {
	return str.substr(p, (x==0) ? (str.length()-x) : x);
}

std::string secure_string_format(std::string s) {
  std::string c;
  int p[2];
  p[0] = 0;
  p[1] = s.length();
  bool _z = 1;
  bool cond = (s.substr(0, 1) == " ") ? false : true;
  
  for(int __=(!cond) ? 0 : s.length();  (!cond) ? (__<= s.length()-1) : (__ >= 0) ; (!cond) ? __++ : __-- ) {
    c = s.substr(__, 1);
    if (c != " ") {
      p[(!cond) ? 0 : 1] = __;
      if (cond) { break;}
      __ = s.length();
      cond = (cond) ? cond : true ;
    }
    
  }

  
  return s.substr(p[0], (p[1]-p[0])+1);
}

int get_n_variable_decl(std::string cond_ex[_cond_p], std::string s) {
  std::string c;
  std::string c_= cond_ex[3];
  for (int _=0; _ <= s.length()-1; _++) {
    c = s.substr(_, 1);
    if (c == c_) {
    	printf("%s\n", secure_string_format(s.substr(_+1, s.length()-(_+1))).c_str());
     return atoi(secure_string_format(s.substr(_+1, s.length()-(_+1))).c_str());
    }
  }
  
  return 0;
}

void magenta::__analysis() {
	std::string exp;
	std::string s;
	int* t;
	for (token::iterator token_ = token__.begin() ; token_ != token__.end(); ++token_) {
		if (__func(*token_)) {
			s = get_str_tok(getn_expression((*token_)));
			if (!__str(s, lex->char_ign)) {
				analy_exp(lex->char_ign, lex->operators, s);
	    }	
	}
	
	if (__if(*token_)) {
		s = get_str_tok(getn_expression((*token_)));
		t = analyse_cond(s, lex->cond_ex);
		analy_exp(lex->char_ign, lex->operators, get_t(s, 1, t[0]));
		analy_exp(lex->char_ign, lex->operators, get_t(s, t[1], (s.length()-t[1])-1));
	}

	if (call__func(*token_)) {
		s = get_str_tok(getn_expression((*token_)));
		if (!__str(s, lex->char_ign)) {analy_exp(lex->char_ign, lex->operators, s);}
	}

	if (var_decl(*token_)) {
		s = get_n_variable_decl(lex->cond_ex, (*token_));
	//	if (!__str(s, lex->char_ign)) {	printf("%s\n", s.c_str()); analy_exp(lex->char_ign, lex->operators, s);}
	}
	
	
}


}

void magenta::__token() {
 lex->lex__(code__);
 st_ st = lex->check__();
 if (st._) {
 	printf("Error ocurred\n");
 	error(st);
 }

token__ = lex->get__token_();
exp_ = lex->get__exp();
__analysis();

}
