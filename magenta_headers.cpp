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
