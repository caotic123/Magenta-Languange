#include "magenta_.h"

int to_int_exp_n(std::string s_, std::string s) {
  int n;
  n = strtol(s.c_str(), NULL, 10);
  if (n == 0) {
    error_(s_.c_str(), "? maybe ()", 0, SEMANTIC_EXPRESSION_CRITICAL_ERROR);
  }
  return n;
}

void magenta::load__file(std::string name) {
  code__ = module->getFile__(name);
  __token();
}

bool magenta::__func(std::string s) {
  if (s.substr(0, strlen(lex->abstract_logic[0][0])) ==
          (std::string)lex->abstract_logic[0][0] &&
      s.substr(strlen(lex->abstract_logic[0][0]), 1) == " ") {
    return true;
  }
  return false;
}

bool magenta::call__func(std::string s) {
  if (s.substr(0, strlen(lex->abstract_logic[7][0])) ==
          (std::string)lex->abstract_logic[7][0] &&
      s.substr(strlen(lex->abstract_logic[7][0]), 1) == " ") {
    return true;
  }
  return false;
}

bool magenta::__if(std::string s) {
  if (s.substr(0, strlen(lex->abstract_logic[1][0])) ==
      (std::string)lex->abstract_logic[1][0]) {
    return true;
  }
  return false;
}

bool magenta::__while(std::string s) {
  if (s.substr(0, strlen(lex->abstract_logic[2][0])) ==
      (std::string)lex->abstract_logic[2][0]) {
    return true;
  }
  return false;
}

bool magenta::__ret(std::string s) {
  if (s.substr(0, strlen(lex->abstract_logic[3][0])) ==
      (std::string)lex->abstract_logic[3][0]) {
    return true;
  }
  return false;
}

bool is_operator(std::string c, std::string op_[len_op]) {
  bool x = false;
  for (int i = 0; i <= len_op; i++) {
    x = (op_[i] == c) ? true : x;
  }

  return x;
}

bool __str(std::string expression, char char_ign[ig__][2]) {
  int p = 0;
  std::string s;
  s = char_ign[1][0];

  if (expression.substr(0, 1) == s) {
    expression = expression.substr(1, expression.length() - 2);
  }

  for (int i = 0; i <= expression.length() - 1; i++) {
    if (expression.substr(i, 1) == "\"") {
      p++;
    }
    if ((p >= 2 || p == 0) && expression.substr(i, 1) != "\"" &&
        expression.substr(i, 1) != " ") {
      p = false;
      break;
    }
  }

  return p;
}

bool is_sep(char char_ign[ig__][2], std::string c) {
  bool x = false;
  std::string s, s_;
  for (int i = 0; i <= ig__ - 1; i++) {
    s = char_ign[i][0];
    s_ = char_ign[i][1];
    x = (c == s || c == s_) ? true : x;
  }

  return x;
}

bool i_c_ex(std::string cond_ex[_cond_p], std::string c_) {
  bool b = false;
  for (int i = 0; i <= 3; i++) {
    b = (c_ == cond_ex[i]) ? true : b;
  }
  return b;
}

int get_priority(std::string x_, std::string cond_ex[_cond_p]) {
  bool b = false;
  for (int i = 0; i <= 3; i++) {
    if (x_ == cond_ex[i]) {
      return i + 1;
    }
  }

  return 0;
}

int *analyse_cond(std::string cond, std::string cond_ex[_cond_p]) {
  int *op = (int *)malloc(sizeof(int) * 3);
  std::string c_;
  for (int i = 0; i <= cond.length() - 1; i++) {
    c_ = cond.substr(i, 1);
    if (i_c_ex(cond_ex, c_)) {
      if (c_ != cond_ex[0] && c_ != cond_ex[1] &&
          !i_c_ex(cond_ex, cond.substr(i + 1, 1))) {
        error_(cond.c_str(), c_.c_str(), i, SEMANTIC_WRITE_COND);
      }
      if (i_c_ex(cond_ex, cond.substr(i + 1, 1)) &&
          get_priority(c_, cond_ex) >
              get_priority(cond.substr(i + 1, 1), cond_ex)) {
        error_(cond.c_str(), c_.c_str(), i, SEMANTIC_OPERATOR_COND_PRECEDENCE);
      }
      if (!i_c_ex(cond_ex, cond.substr(i + 1, 1))) {
        op[0] = i - 1;
        op[1] = i + 1;
      } else {
        op[0] = i - 1;
        op[1] = i + 2;
      }

      break;
    }
  }
  return op;
}

int get__p(std::string s, std::string c, int x, std::string operators[len_op],
           char char_ign[ig__][2]) {
  int p__ = 0;
  int _p_ = -1;
  std::string s__[2];
  for (int i = x; i >= 0; i--) {
    s__[0] = char_ign[1][0];
    s__[1] = char_ign[1][1];

    p__ = (s.substr(i, 1) == s__[1])
              ? p__ + 1
              : (s.substr(i, 1) == s__[0]) ? (p__ == 0) ? p__ : p__ - 1 : p__;
    if ((is_operator(s.substr(i, 1), operators) || (s.substr(i, 1) == s__[0]) ||
         (s.substr(i, 1) == s__[1])) &&
        s.substr(i, 1) != c && p__ == 0) {

      return i;
    }
  }
  return _p_;
}

int get__tp(std::string s, std::string c, int x, std::string operators[len_op],
            char char_ign[ig__][2]) {
  int p_ = s.length();
  int p__ = 0;
  std::string s__[2];
  for (int i = x; i <= s.length() - 1; i++) {
    s__[0] = char_ign[1][0];
    s__[1] = char_ign[1][1];
    p__ = (s.substr(i, 1) == s__[0])
              ? p__ + 1
              : (s.substr(i, 1) == s__[1]) ? ((p__ == 0) ? p__ : p__ - 1) : p__;

    if ((is_operator(s.substr(i, 1), operators) ||
         (s.substr(i, 1) == s__[1])) &&
        s.substr(i, 1) != c && p__ == 0) {
      p_ = i;
      return p_;
    }
  }

  return p_;
}

std::string get_precedence_str(std::string str_, std::string op,
                               std::string operators[len_op],
                               char char_ign[ig__][2]) {
  std::string c;
  bool b = false;
  int _;
  std::string s__[2];
  for (int i_ = 0; i_ <= str_.length(); i_++) {
    s__[0] = char_ign[1][0];
    s__[1] = char_ign[1][1];
    c = str_.substr(i_, 1);
    if (is_operator(c, operators) && c == op && !b) {
      _ = get__p(str_, op, i_ - 1, operators, char_ign) + 1;
      str_ = str_.substr(0, _) + s__[0] + str_.substr(_, str_.length() - _);
      b = true;
    }

    if ((is_operator(c, operators) || c == s__[1] || c == s__[0] ||
         c == "\0") &&
        c != op && b) {
      _ = get__tp(str_, op, i_, operators, char_ign);
      str_ = str_.substr(0, _) + s__[1] + str_.substr(_, str_.length() - _);
      b = false;
    }
  }

  return str_;
}

int is__func_var(std::string s, std::string op_[len_op],
                 char char_ign[ig__][2]) {
  std::string c, c_;
  std::string s_[2];
  s_[0] = char_ign[1][0];
  s_[1] = char_ign[1][1];
  for (int i = 0; i <= (s.length() - 1); i++) {
    c = s.substr(i, 1);
    c_ = s.substr(i + 1, 1);
    if (!is_operator(c, op_) && c != s_[0] && c != s_[1] && c_ == s_[0]) {
      return i;
    }
  }

  return 0;
}

std::vector<std::string> get_par_func(std::string s_, std::string op[len_op],
                                      char char_ign[ig__][2]) {
  int i;
  bool _ = false;
  std::string c_;
  std::string arg;
  std::vector<std::string> s__;
  std::string p__;
  p__ = char_ign[0][0];
  int c__=0;
  int p = is__func_var(s_, op, char_ign) + 2;
  for (i = 0; i <= s_.length(); i++) {
    c_ = s_.substr(i, 1);
    c__ = (c_ == p__) ? ((c__==0) ? 1 : 0) : c__;
    if (c_ == op[5] && c__ == 0) {
      arg = s_.substr(p, i - p);
      p = i + 1;
      s__.push_back(arg);
      _ = true;
    }
  }
  
  if (!_) {
  	arg = s_.substr((is__func_var(s_, op, char_ign) + 1), (s_.length() - 2));
  	s__.push_back(arg);
  	return s__;
  }

  arg = s_.substr(p, (s_.length() - p) - 2);
  s__.push_back(arg);
  return s__;
}

bool analyse_ref_func(std::string va_, std::string op[len_op]) {
	std::string c_;
	for (int q=0; q<= va_.length()-1; q++) {
		c_ = va_.substr(q, 1);
		if (c_ == " " || is_operator(c_, op)) {
			error_(va_.c_str(), "don't valid function parameter", 0, SEMANTIC_FUNCTION_PARAMENTER_CRITICAL_ERROR);
			return false;
		}
	}
	
	return true;
}


std::string analy_exp(char op[ig__][2], std::string op_[len_op],
                      std::string str, bool t=true) {
  std::string c;
  std::string s, x_;
  bool z__ = true;
  bool y__ = true;
  int p_ = 0;
  int q_;
  int i__;
  int i;
  std::string char__, char____;
  std::string secure_string;
  char__ = op[1][0];
  char____ = op[1][1];

  if (is__func_var(str, op_, op) != 0) {
    error_(str.c_str(), "function var", 0,
           SEMANTIC_EXPRESSION_USED_IN_FUNCTION);
  }

  if (str.substr(0, 1) != char__ ||
      str.substr(str.length() - 1, 1) != char____) {
    error_(str.c_str(), "() dont load var", 0,
           SEMANTIC_EXPRESSION_CRITICAL_ERROR);
  }

  for (i = 0; i <= str.length() - 1; i++) {
    c = str.substr(i, 1);
    s = op[1][0];
    x_ = op[1][1];
    p_ = (c == s) ? p_ + 1 : (c == x_) ? p_ - 1 : p_;

    if (c == " " && i < (str.length() - 1) && str.substr(i + 1, 1) != " " &&
        i > 0 && str.substr(i - 1, 1) != " ") {
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
        if (str.substr(q_, 1) != " " && !is_sep(op, str.substr(q_, 1)) &&
            !is_operator(str.substr(q_, 1), op_)) {
          y__ = true;
          break;
        }
      }
      for (q_ = i - 1; q_ >= 0 && y__; q_--) {
        if (str.substr(q_, 1) != " " && !is_sep(op, str.substr(q_, 1)) &&
            !is_operator(str.substr(q_, 1), op_)) {
          y__ = true;
          break;
        }
      }
    }

    if (!z__ || !y__) {
      error_(str.c_str(), c.c_str(), i, SEMANTIC_OPERATOR_INCONSISTENT);
    }
  }

  if (p_ != 0) {
    error_(str.c_str(), (p_ > 0) ? ")" : "(", i, SEMANTIC_CHARACTER_ILLEGAL);
  }

  if (t) {
  str = get_precedence_str(str, op_[2], op_, op);
  str = get_precedence_str(str, op_[3], op_, op);
  str = get_precedence_str(str, op_[4], op_, op);
  }

  return str;
}

int magenta::getn_expression(std::string str_) {
  int n_int;
  std::string buf;
  try {
    std::size_t found = str_.find(lex->char_ign[1][0]);
    str_ = str_.substr(found, str_.length() - found - 1);

    buf = str_;
    if (found == std::string::npos) {
      error_(buf.c_str(), "?", 0, SEMANTIC_WRITE_FUNC);
    }

    buf = "";

    std::remove_copy(str_.begin(), str_.end(), std::back_inserter(buf), ' ');
    n_int = to_int_exp_n(str_, buf.substr(1, buf.length() - 2));
  } catch (std::exception e) {
    error_(str_.c_str(), "maybe () ?", 0, SEMANTIC_EXPRESSION_CRITICAL_ERROR);
  }

  return n_int;
}

bool magenta::var_decl(std::string s) {
  std::string c, p;
  p = lex->abstract_logic[5][0];
  for (int i = 0; i <= s.length() - 1; i++) {
    c = s.substr(i, 1);
    if (c == p) {
      return true;
    }
    if (c != " " && c != p) {
      return false;
    }
  }
  return false;
}

std::string magenta::get_str_tok(std::string s_, int n) {
  try {
    exp_.at(n);
  } catch (std::exception e) {
    error_(s_.c_str(), "? maybe ()", 0, SEMANTIC_EXPRESSION_CRITICAL_ERROR);
  }

  return secure_string_format(exp_[n]);
}

std::string get_t(std::string str, int p, int x) {
  return str.substr(p, (x == 0) ? (str.length() - x) : x);
}

int magenta::get_n_variable_decl(std::string s) {
  std::string c;
  std::string c_ = lex->cond_ex[3];
  std::string s_;
  for (int _ = 0; _ <= s.length() - 1; _++) {
    c = s.substr(_, 1);
    if (c == c_) {
      s_ = secure_string_format(s.substr(_ + 1, s.length() - (_ + 1)));
      s_ = s_.substr(1, s_.length() - 2);
      return to_int_exp_n(s, s_);
    }
  }

  return 0;
}

int get__c(std::string s, int x, std::string _op) {
  for (int i=x; i<= s.length()-1; i++) {
    if (s.substr(i, 1) == _op) {
      return i;
    }
  }
  return 0;
}


int get_pr_str(std::string s) {
  std::size_t _ = s.find("]");
  return strtol((s.substr(2, 1)+s.substr(_+1, (s.length()-(_+1))-1)).c_str(), NULL, 10);
} 

bool is_precedence_value(std::string s) // only expression value which has precedence more 2+ 
{
  if (s.substr(1, 1) == "[" && s.substr((s.length()-1)-1, 1) == "]") {
    return true;
  }
  return false;
}

std::vector<std::string> token_exp(std::string s, std::string op_[len_op]) {
  int p = 1;
  std::string c,s_;
  std::vector <std::string> token___;
  for (int i=0; i <= s.length()-1; i++) {
    c = s.substr(i, 1);
    if (is_operator(c, op_)) {
      s_ = s.substr(p, i-p);
      p  = i+1;
      token___.push_back(s_);
      token___.push_back(c);
    }
  }
  s_ = s.substr(p, (s.length()-p)-1);
  token___.push_back(s_);

  return token___;
}

struct_ep c__m(struct_ep struct_s, std::string operators[len_op], char char_ign[ig__][2]) {
  int p=0;
  int p_=0;
  int i=0;
  int y__=0;
  std::string s = struct_s.s;
  std::string c_,str_;
  std::string char_, char__;
  char_ = char_ign[1][0];
  char__ = char_ign[1][1];
  char buffer[100];
  for (int _=0; _ <= s.length()-1; _++) {
    c_ = s.substr(_, 1);
    p = (c_ == char_) ? p+1 : (c_ == char__) ? p-1 : p;
    if (c_ == char_ && (p > p_  || (p == p_ && _ < y__)) ) {
      i = _;
      p_ = p;
      y__ = _;
    }
  }

  if (i==0) {struct_s.t = false; return struct_s;}
  str_ = s.substr(i, get__c(s, i, char__)-i+1);
  sprintf(buffer, "%d", struct_s.n_.size());
    if (!is_precedence_value(str_)) {
    struct_s.n_.push_back(token_exp(str_, operators));
    }
    else {
      struct_s.n_.push_back(struct_s.n_[get_pr_str(str_)]);
    }

  s = s.substr(0, i)+"["+std::string(buffer)+"]"+s.substr(i+str_.length(), s.length()-(i+str_.length()));
  struct_s.s = s;
  
  return struct_s;
}

struct_ep r__str(std::string str, std::string operators[len_op], char char_ign[ig__][2]) {
  struct_ep s_;
  s_.s = str;
  s_.t = true;
  while(s_.t) {
   s_ = c__m(s_, operators, char_ign);
  }

  return s_;
}

bool is_correct_function_name(std::string s, char sym_[__symb][2], std::string operators[len_op]) {
	char f__ = s[0];
	if ( !(((f__ >= sym_[1][0] &&  f__ <= sym_[1][1]) || (f__ >= sym_[2][0] &&  f__ <= sym_[2][1])) && !is_operator(s.substr(0, 1), operators) && f__ != 93 && f__ != 94 )) {
		error_(s.c_str(), "function name is not correct use", 0, SEMANTIC_FUNC_ERROR_NAME);
	}

	for(int q=0; q <= s.length()-1; q++) {
		if (is_operator(s.substr(q, 1), operators)) {
			error_(s.c_str(), "function name is not correct use", 0, SEMANTIC_FUNC_ERROR_NAME);
		}
	}

  return true;
}

std::string get_func_name(std::string s, const char* abstract_logic[__abs][2], char char_ign[ig__][2] ) {
  std::size_t p_ = s.find(abstract_logic[0][0]);
  std::size_t _ = s.find(char_ign[1][0]);
  if (p_ == std::string::npos || _ == std::string::npos) {
  	error_(s.c_str(), "? function don't valid'", 0, SEMANTIC_FUNCTION_UNDEFINED);
  }
  
  return s.substr(p_+9, _-(p_+9));
}

bool ref_empty(std::string str, char char_ign[ig__][2]) {
	std::string s_;
	std::string _s;
	s_ = char_ign[1][0];
	_s = char_ign[1][1];

	return (str == (s_+_s) ? true : false); 
}

struct_ep create_ep_empty() {
	struct_ep s_;
	s_.t = false;
	return s_;
}

std::vector<std::string> get_func_ref(std::string str, std::string operators[len_op], char char_ign[ig__][2]) {
  std::string c,c__;
  std::string arg;
  std::vector<std::string> par__;
  int p = 1;
  int p_ = 0;
  bool b;
  c__ = char_ign[0][0];
  for (int q=0; q <= str.length()-1; q++) {
    c = str.substr(q, 1);
    p_ = (c==c__) ? (p_==0 ? 1 : 0) : p_;
    if (c == operators[5] && p_ == 0) {
      arg = str.substr(p, q-p);
      p = q+1;
      par__.push_back(arg);
      b = true;
    }
  }
  
  if (!b) {
    arg = str.substr(1, str.length()-2);
    par__.push_back(arg);
    return par__;
  }

  arg = str.substr(p, (str.length()-p)-1);
  par__.push_back(arg);

return par__;
}

bool is_correct_var_name(std::string s, char sym_[__symb][2], std::string operators[len_op]) {
	char f__ = s[0];
	if ( !(((f__ >= sym_[1][0] &&  f__ <= sym_[1][1]) || (f__ >= sym_[2][0] &&  f__ <= sym_[2][1])) && !is_operator(s.substr(0, 1), operators) && f__ != 93 && f__ != 94 )) {
		error_(s.c_str(), "variable name is not correct use", 0, SEMANTIC_VARIABLE_ERROR_NAME);
	}
	
	for(int q=0; q <= s.length()-1; q++) {
		if (is_operator(s.substr(q, 1), operators)) {
			error_(s.c_str(), "variable name is not correct use", 0, SEMANTIC_VARIABLE_ERROR_NAME);
		}
	}

  return true;
}

std::string get_var_name(std::string s, std::string cond_ex[_cond_p], const char* abstract_logic[__abs][2], char sym_[__symb][2], std::string operators[len_op]) {
  std::string c_;
  std::size_t __ = s.find(abstract_logic[5][0]);
  for(int _=__; _ <= s.length()-1; _++) {
    c_ = s.substr(_, 1);
      if (c_ == cond_ex[3]) {
      	is_correct_var_name(secure_string_format(s.substr(1, _-1)), sym_, operators);
      return secure_string_format(s.substr(1, _-1));  
    }
  }

  error_(s.c_str(), "? variable has a correct name?", 0, SEMANTIC_VARIABLE_ERROR_NAME);
}

void magenta::__analysis() {
  std::string exp;
  std::string s, s__par;
  int *t;
  struct_ep s_;
  std::string ___s, ___a;
  std::vector<std::string> par__;

  for (token::iterator token_ = token__.begin(); token_ != token__.end();
       ++token_) {
    s_ = create_ep_empty();
    if (__func(*token_)) {
      s = secure_string_format(
          get_str_tok((*token_), getn_expression((*token_))));
         is_correct_function_name(get_func_name(*token_, lex->abstract_logic, lex->char_ign), lex->sym_, lex->operators);          
          compiler->create_function(get_func_name((*token_), lex->abstract_logic, lex->char_ign));
          compiler->create_label("entry");
      if (!ref_empty(s, lex->char_ign)) {
        par__ = get_func_ref(s, lex->operators, lex->char_ign);
        for (std::vector<std::string>::iterator i_ = par__.begin();
             i_ != par__.end(); i_++) {
          s__par = secure_string_format((*i_));
          if (__str(s__par, lex->char_ign)) {
          error_((*token_).c_str(), "parameter don't suport string refs", 0, SEMANTIC_FUNCTION_PARAMENTER_CRITICAL_ERROR);	
		  }
		  
		   {analyse_ref_func(s__par, lex->operators);}
          compiler->set_function_args(s__par, lex->char_ign);
       }
   }
   
    }

    if (__if(*token_)) {
      s = get_str_tok((*token_), getn_expression((*token_)));
      t = analyse_cond(s, lex->cond_ex);
      ___s = analy_exp(lex->char_ign, lex->operators, secure_string_format(get_t(s, 1, t[0])));
      s_ = r__str(___s, lex->operators, lex->char_ign);
      ___a = analy_exp(lex->char_ign, lex->operators, secure_string_format(get_t(s, t[1], (s.length() - t[1]) - 1)));
      s_ = r__str(___a, lex->operators, lex->char_ign);
    }

    if (call__func(*token_)) {
      s = secure_string_format(get_str_tok((*token_), getn_expression((*token_))));
      if (!__str(s, lex->char_ign)) {
        par__ = get_func_ref(s, lex->operators, lex->char_ign);
        for (std::vector<std::string>::iterator i_ = par__.begin();
             i_ != par__.end(); i_++) {
          s__par = secure_string_format((*i_));
          s__par = analy_exp(lex->char_ign, lex->operators, s__par);
          s_ = r__str(s__par, lex->operators, lex->char_ign);
        }
      }
    }

    if (var_decl(*token_)) {
      s = secure_string_format(get_str_tok((*token_), get_n_variable_decl((*token_))));

      if (is__func_var(s, lex->operators, lex->char_ign) != 0) {
        par__ = get_par_func(s, lex->operators, lex->char_ign);
        for (std::vector<std::string>::iterator i_ = par__.begin();
             i_ != par__.end(); i_++) {
          s__par = secure_string_format((*i_));
          analy_exp(lex->char_ign, lex->operators, s__par);
          s_ = r__str(s__par, lex->operators, lex->char_ign);
        }
        
      } else {
        if (!__str(s, lex->char_ign)) {
        s = secure_string_format(analy_exp(lex->char_ign, lex->operators, s));
        s_ = r__str(s, lex->operators, lex->char_ign);
        compiler->create_var(get_var_name((*token_), lex->cond_ex, lex->abstract_logic, lex->sym_, lex->operators), lex->char_ign, s_);
        }
        else {
      	// if str value
		}
    }
    
    }

    if (__while(*token_)) {
      s = get_str_tok((*token_), getn_expression((*token_)));
      t = analyse_cond(s, lex->cond_ex);
      ___s  = analy_exp(lex->char_ign, lex->operators, secure_string_format(get_t(s, 1, t[0])));
      s_ = r__str(___s, lex->operators, lex->char_ign);
      ___a = analy_exp(lex->char_ign, lex->operators, secure_string_format(get_t(s, t[1], (s.length() - t[1]) - 1)));
       s_ = r__str(___a, lex->operators, lex->char_ign);
    }

    if (__ret(*token_)) {
      s = secure_string_format(get_str_tok((*token_), getn_expression((*token_))));
      if (!__str(s, lex->char_ign)) {
       s = analy_exp(lex->char_ign, lex->operators, s);
       s_ = r__str(s, lex->operators, lex->char_ign);
      }
    }
  }
  compiler->compile();
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
