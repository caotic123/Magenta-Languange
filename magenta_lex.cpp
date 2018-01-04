#include "magenta_lex.h"

char* c(char* y, int t, int a)
{
    int i = 0;
    int len;
    char* str = (char*)malloc(sizeof(char) * a + 1);
    for (int s = t; s <= (t + a) - 1; s++) {
        str[i] = y[s];
        i++;
    }

    str[i] = '\0';

    return str;
}

void lex_::lex__(std::string x)
{
    __input = x;

}

st_ char___(char sym_[__symb][2], char* str)
{
    bool _b = false;
    st_ error_handle;
    error_handle._ = false;
    char c;
    for (int i = 0; i <= strlen(str) - 1; i++) {
        c = str[i];
        error_handle.l = c;
        for (int i_ = 0; i_ <= __symb - 1; i_++) {
            if ((c == sym_[i_][0]) || (c >= sym_[i_][0] && c <= sym_[i_][1])) {
                _b = true;
            }
        }
    }

    if (!_b) {
        error_handle._ = true;
        error_handle.error = LEXICAL_CHARACTER_DONT_FOUND;
    }

    error_handle.l = 0;
    return error_handle;
}

token lex_::get__token_()
{
    return token_lex;
}

st_ new_st()
{
    st_ st;
    st._ = true;
    st.error = INIT_ID;
}

std::string lex_::l__(std::string str, std::string sep, std::string sep_)
{
    bool _b = false;
    int l[2] = { 0, 0 };
    int i = 0, i_ = 0;
    char int_[100];
    std::stringstream new_string;
    std::string c;
    int n__len_;
    int q = 1;
    std::string e;
    for (i; i <= str.length(); i++) {
        c = str.substr(i, 1);
        i_ = (sep == sep_) ? ((c == sep) ? ((i_ == 1) ? 0 : 1) : i_) : (c == sep) ? i_ + 1 : (c == sep_) ? i_ - 1 : i_;

        if (!_b && c == sep) {
            _b = true;
            l[0] = i;
            e = str.substr(l[0] + (str.length() - l[0] > 9) ? 9 : 0, (str.length() - (l[0] + (str.length() - l[0] > 9) ? 9 : 0) > 4) ? 4 : 0);
        }

        if (_b && c == sep_ && i_ == 0) {
            l[1] = i;
            new_string.str("");
            q = n__.size();
            n__len_ = sprintf(int_, "%d", q);
            new_string << str.substr(0, l[0] + 1) << int_ << str.substr(l[1], str.length() - l[1]);
            i = (l[0] + 1) + n__len_ + 2;
            n__.push_back(str.substr(l[0], (l[1] - l[0]) + 1));
            str = new_string.str();
            l[0] = 0;
            l[1] = 0;
            _b = false;
        }
    }
    if (i_ != 0) {
        printf("LEXICAL ERROR: LINE OF CODE BROKEN\n");
        printf("In ...%s...\n", e.c_str());
        printf("Use of illegal way of characters \"(\" \")\"\n");
        system("pause");
        exit(0);
    }

    return str;
}

token lex_::get__exp()
{
    return n__;
}

int next_abs(const char* a_[__abs][2], char* u, int ___a)
{
    int _ = 0;
    char* buf;
    for (int i = 0; i <= (strlen(u) - 1); i++) {
        for (int i_ = 0; i_ <= (__abs - 1); i_++) {
            if (strcmp(c(u, i, strlen(a_[___a][1])), a_[___a][1]) == 0 && strcmp(c(u, i + strlen(a_[___a][1]), strlen(a_[i_][0])), a_[i_][0]) == 0) {
                _ = i + strlen(a_[___a][1]);
                return _;
            }
        }
    }
    return _;
}

st_ lex_::check__()
{
    char* __;
    bool check_b;
  
    macro mag_macro = macro(__input, abstract_logic, char_ign, operators, cond_ex);

    st_ st = char___(sym_, (char*)__input.c_str());

    if (st._) {
        return st;
    }

    std::string _lex_buffer = __input;
    std::string sep, sep_;

    for (int ___i = 0; ___i <= ig__ - 1; ___i++) {
        sep = char_ign[___i][0];
        sep_ = char_ign[___i][1];
        _lex_buffer = l__(_lex_buffer, sep, sep_);
    }

    __ = (char*)malloc(sizeof(char) * (_lex_buffer.length() + 1));

    strncpy(__, _lex_buffer.c_str(), sizeof(char) * (_lex_buffer.length() + 1));

    int q = 0;
    while (true) {
        check_b = false;
        for (int _ = 0; _ <= (__abs - 1); _++) {
            if (strcmp(c(__, q, strlen(abstract_logic[_][0])), abstract_logic[_][0]) == 0) {
                int q = next_abs(abstract_logic, __, _);
                if (q <= 0) {
                    token_lex.push_back(c(__, q, strlen(__) - q)); // last token
                    return st;
                }

                token_lex.push_back(c(__, 0, q));
                __ = c(__, next_abs(abstract_logic, __, _), strlen(__) - q);
                check_b = true;
                break;
            }
        }

        if (!check_b) {
            printf("Compilation interrupted\n");
            if (strlen(__) - 10 > 9) {
                printf("Error in use of %s\n", c(__, 0, 9));
            }

            printf("Check the logical structures names\n");
            system("pause");
            exit(0);
        }
    }

    return st;
}
