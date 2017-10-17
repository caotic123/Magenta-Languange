#include "magenta_header.h"

std::string secure_string_format(std::string s) {
  std::string c;
  int p[2];
  p[0] = 0;
  p[1] = s.length();
  bool _z = 1;
  bool cond = false;

  for (int __ = (!cond) ? 0 : s.length();
       (!cond) ? (__ <= s.length() - 1) : (__ >= 0); (!cond) ? __++ : __--) {
    c = s.substr(__, 1);
    if (c != " ") {
      p[(!cond) ? 0 : 1] = __;
      if (cond) {
        break;
      }
      __ = s.length();
      cond = (cond) ? cond : true;
    }
  }

  return s.substr(p[0], (p[1] - p[0]) + 1);
}

void error(st_ st) {
  switch (st.error) {
  case LEXICAL_CHARACTER_DONT_FOUND:
    printf("Illegal character: used in line %d\n", st.l);
    break;
  case SEMANTIC_CHARACTER_ILLEGAL:
    printf("Illegal expression: used illegal combination of characters in %d\n",
           st.l);
    break;
  case SEMANTIC_OPERATOR_INCONSISTENT:
    printf("Illegal expression: the use of the operator in this way is illegal "
           "%d\n",
           st.l);
    break;
  case SEMANTIC_WRITE_FUNC:
    printf(
        "Illegal function: the use of the function in this way is illegal %d\n",
        st.l);
    break;
  case SEMANTIC_WRITE_COND:
    printf("Illegal condition: the use of the condition in this way is illegal "
           "%d\n",
           st.l);
    break;
  case SEMANTIC_OPERATOR_COND_PRECEDENCE:
    printf("Illegal condtion: check condition precedence %d\n", st.l);
  case SEMANTIC_EXPRESSION_CRITICAL_ERROR:
    printf("Illegal expression: check expression (?) %d\n", st.l);
    break;
  case SEMANTIC_EXPRESSION_USED_IN_FUNCTION:
    printf("Illegal expression: check if a expression has function value %d\n",
           st.l);
  case SEMANTIC_FUNCTION_PARAMENTER_CRITICAL_ERROR:
    printf("Illegal function: check if a parameter function is correct %d\n",
           st.l);
  case SEMANTIC_VARIABLE_ERROR_NAME:
    printf("Illegal variable: check if name of variable is correct %d\n",
           st.l);
    break;
  case SEMANTIC_FUNC_ERROR_NAME:
    printf("Illegal function: check if name of function is correct %d\n",
           st.l);
    break;
  case COMPILER_VARIABLE_DONT_FOUND:
    printf("VARIABLE: check if variable was declared and check your name %d\n",
           st.l);
    break;
  case COMPILER_VARIABLE_TYPE_ERROR:
    printf("VARIABLE: check type of variable and check name of variable %d\n",
           st.l);
    break;
  case COMPILER_CONDITION_VARIABLE_DONT_FOUND:
    printf("CONDITION: check values the condition",
           st.l);
    break;
   case ABSTRACT_COMMAND_DONT_FOUND:
    printf("LINE: CRITICAL ERROR COMMAND DON'T EXIST CHECK IF THE COMMAND NAME IS CORRECT",
           st.l);
    break;   

  default:
    printf("A unknow error ocurred\n");
  }

  system("pause");
  exit(0);
}

void error_(const char *s, const char *ex_, int i, error_id error__) {
  st_ st;
  st.error = error__;
  st.l = i;
  st._ = true;
  printf("%s Incorrect use of \"%s\"\n", s, ex_);
  error(st);
}

bool is_operator(std::string c, std::string op_[len_op]) {
  bool x = false;
  for (int i = 0; i <= len_op-1; i++) {
    x = (op_[i] == c) ? true : x;
  }

  return x;
}

char* int_to_string(int n) {
	char* buffer = (char*)malloc(sizeof(char)*100);
	sprintf(buffer, "%d", n);
	return buffer;
}

bool is_precedence_value(std::string s) // only expression value which has precedence more 2+ 
{
  std::size_t _ = s.find("]");
  if (s.substr(1, 1) == "[" && s.substr((s.length()-1)-1, 1) == "]" && _ == s.length()-2 ) {
    return true;
  }
  return false;
}

bool is_prec_value(std::string s)
{
  if (s.substr(0, 1) == "[" && s.substr((s.length()-1), 1) == "]") {
    return true;
  }
  return false;
}

int get_pr_str(std::string s) {
  std::size_t _ = s.find("]");
  return strtol((s.substr(2, 1)+s.substr(_+1, (s.length()-(_+1))-1)).c_str(), NULL, 10);
}

int get_pr_str_value(std::string s) {
  return strtol(s.substr(1, (s.length()-2)).c_str(), NULL, 10);
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

std::string get__file(std::string name)
{
    int length;
    std::string buffer;
    std::string _cs;
    std::ifstream __f;
    __f.open(name);
    if (!__f) {
        std::cout << "ERROR DON'T LOAD FILE CODE\n";
        system("pause");
        exit(EXIT_FAILURE);
    }

    if (__f.is_open()) {
        while (!__f.eof()) {
            getline(__f, buffer);
            _cs = _cs + buffer + "\n";
        }
    }

    return _cs;
}

std::string getFile__(std::string name) // load only .mag files
{
    int length;
    std::string buffer;
    std::string _cs;
    std::ifstream __f;
    __f.open("mag_files/" + name + ".mag");
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
    
    std::replace( _cs.begin(), _cs.end(), '\n', ' ');

    return _cs;
}

void magenta_run(std::string name, std::string code) {
std::string compiler_depedence = get__file("llvm/basic_depende.ll");
std::ofstream outfile ("llvm/compile.ll");
outfile << compiler_depedence << std::endl;
outfile << code << std::endl;
outfile.close();
#if _WIN32
name = (name + ".exe");
#endif
system((std::string("clang -Wno-everything -O3 ") + std::string("llvm/compile.ll") + " -o "  + name).c_str());
system(name.c_str());
}
