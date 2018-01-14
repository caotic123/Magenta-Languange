#include "macro.h"

std::vector<std::string> macro::tok(std::string str, const char* abstract_logic[__abs][2])
{
    std::vector<std::string> tok_macro;
    std::string s = std::string(abstract_logic[5][0]) + s_r[0], s_ = std::string(abstract_logic[5][0]) + s_r[3];
    std::size_t _ = str.find(s);

    while (_ != std::string::npos) {
        if (str.find(s_, _) == std::string::npos) {
            error_("MACRO", "macro don't delimited", _, MACRO_ERROR);
        }
        tok_macro.push_back(str.substr(_, str.find(s_, _) - _));
        _ = str.find(s, (_ + s.length()) + 1);
    }

    return tok_macro;
}

std::string macro::g_syntax(std::string t, const char* abstract_logic[__abs][2])
{
    std::vector<std::string>::iterator __ = macro_reseverd.begin();
    std::string c_;
    std::string s = std::string(abstract_logic[5][0]) + s_r[0] + " " + s_r[2], ___r;
    std::size_t _ = t.find(s), s_;
    std::vector<std::size_t> t__;
    std::function<void(std::string)> func_ = [&](std::string n) {if (t.find(n, _+s.length()) != std::string::npos) {t__.push_back(t.find(n, _+s.length()));} };
    std::for_each(macro_reseverd.begin(), macro_reseverd.end(), func_);
    std::sort(t__.begin(), t__.end());
    if (t__.begin() != t__.end()) {
        ___r = t.substr(_ + s.length(), (*t__.begin()) - (_ + s.length()));
        return secure_string_format(___r);
    }

    error_("MACRO", "macro has rules?", _, MACRO_ERROR);
}

std::vector<std::string> syntax_tok(std::string syn_, char char_ign[ig__][2])
{
    std::vector<std::string> tok_;
    std::string c_, token_;
    bool p_ = false;
    std::string char_;
    for (int i = 0; i <= syn_.length(); i++) {
        char_ = char_ign[1][1];
        p_ = (c_ == char_) ? true : p_;
        c_ = syn_.substr(i, 1);
        char_ = char_ign[1][0];
        if ((c_ == char_ && token_.length() > 0) || p_ || (i >= syn_.length() && token_.length() > 0)) {
            tok_.push_back(token_);
            token_ = "";
            p_ = false;
        }
        token_ = token_ + c_;
    }

    if (p_) {
        error_("MACRO", "syntax definition was defined?", 0, MACRO_ERROR);
    }

    return tok_;
}

std::tuple<int, int> macro::mac_p(std::string s, const char* abstract_logic[__abs][2])
{
    std::string c_;
    bool p_ = false;
    std::string macr_;
    std::string __pr = std::string(abstract_logic[5][0]) + s_r[1];
    for (int i = 0; i <= s.length(); i++) {
        if (c_ != " " && !p_ && s.substr(i, __pr.length()) != __pr) {
            return std::make_tuple(0, 0);
        }
        if (s.substr(i, __pr.length()) == __pr) {
            if (!p_) {
                p_ = true;
            }
            else {
                return std::make_tuple(__pr.length(), macr_.length());
            }
        }
        macr_ = macr_ + s.substr(i, 1);
    }

    return std::make_tuple(0, 0);
}

std::tuple<std::string, std::string> macro::g_macro(std::string _, const char* abstract_logic[__abs][2])
{
    std::tuple<int, int> r = mac_p(_, abstract_logic);
    std::string c_, s_;
    if (std::get<0>(r) == 0 && std::get<0>(r) == 0) {
        return std::make_tuple(_, "");
    }

    return std::make_tuple(secure_string_format(_.substr(std::get<0>(r), std::get<1>(r) - std::get<0>(r))), secure_string_format(_.substr(std::get<1>(r) + std::get<0>(r), _.length() - (std::get<1>(r) + std::get<0>(r)))));
}

std::map<std::string, std::vector<std::string> > macro::macr_c(std::string macrs_, char char_ign[ig__][2])
{
    std::map<std::string, std::vector<std::string> > t;
    std::function<std::string(std::string, std::vector<std::string>::iterator)> eq_ = [&](std::string _, std::vector<std::string>::iterator __) {
        return ((__ == macro_reseverd.end()) ? "" : ((_ == (*__)) ? (*__) : eq_(_, ++__)));
    };

    std::function<int(std::string, int, std::string, std::string)> next_special = [&](std::string _, int ss_, std::string __, std::string ___) {
        int p_ = 0;

        std::string c_;
        bool s = false;
        std::string spec_;
        spec_ = char_ign[0][0];
        for (int i_ = ss_; i_ <= _.length(); i_++) {
            c_ = _.substr(i_, 1);
            if (!s) {
                p_ = (c_ == __) ? (p_ + 1) : (c_ == ___) ? (p_ - 1) : p_;
                if (c_ == ___ && p_ == 0) {
                    return i_;
                }
            }
            s = (c_ == spec_) ? !s : s;
        }

        error_("MACRO", "illegal definition of rule", 0, MACRO_ERROR);
        return 0;
    };

    int i = 0;
    std::string c_;
    for (int _ = 0; _ <= macrs_.length(); _++) {
        c_ = macrs_.substr(_, 1);
        if ((c_ == " " || c_ == "\n") && eq_(macrs_.substr(i + 1, _ - (i + 1)), macro_reseverd.begin()) != "") {

            if (t.find(macrs_.substr(i + 1, _ - (i + 1))) == t.end()) {
                t[macrs_.substr(i + 1, _ - (i + 1))] = (std::vector<std::string>){ (macrs_.substr(macrs_.find(syntax_r[0], i), (next_special(macrs_, i, syntax_r[0], syntax_r[1]) - macrs_.find(syntax_r[0], i)) + 1)) };
            }
            else {
                t[macrs_.substr(i + 1, _ - (i + 1))].push_back(macrs_.substr(macrs_.find(syntax_r[0], i), (next_special(macrs_, i, syntax_r[0], syntax_r[1]) - macrs_.find(syntax_r[0], i)) + 1));
            }
        }
        i = (c_ == " " || c_ == "\n") ? _ : i;
    }

    return t;
}

std::tuple<bool, std::map<std::string, std::string>, int> macro::is_mac(std::vector<std::string> t, std::string _, char char_ign[ig__][2])
{
    int i = 0;
    std::string symbol_of_context[3];
    std::map<std::string, std::string> map_context;
    symbol_of_context[0] = char_ign[1][0];
    symbol_of_context[1] = char_ign[1][1];
    symbol_of_context[2] = char_ign[0][0];
    std::map<std::string, std::string> context;
    std::function<bool(std::string)> is_context = [&](std::string str) { return (str.length() > 4 && str.substr(0, 1) == symbol_of_context[0] && str.substr(str.length() - 1, 1) == symbol_of_context[1] && str.substr(1, 3) == f_[0]) ? true : false; };
    std::function<int(std::string, int, int, bool)> must_ins = [&](std::string t, int p_, int r, bool _) {
        if (r == 0) {
            return p_;
        }
        if (p_ == t.length()) { /*error if a variable is a tok */
            return 0;
        }
        return must_ins(t, p_ + 1, ((t.substr(p_, 1) == symbol_of_context[0] && _) ? r + 1 : (t.substr(p_, 1) == symbol_of_context[1] && _) ? r - 1 : r), (t.substr(p_, 1) == symbol_of_context[2]) ? !_ : _);
    };
    std::function<bool(std::string)> free_context = [&](std::string n_) { return (n_.substr(0, 1) == symbol_of_context[0] && must_ins(n_, 1, 1, true) != 0) ? true : false; };

    for (std::vector<std::string>::iterator i_ = t.begin(); i_ != t.end(); i_++) {
        if (!is_context((*i_)) && _.substr(i, (*i_).length()) != (*i_) || (is_context((*i_)) && !free_context(_.substr(i, _.length() - i)))) {
            return std::make_tuple(false, map_context, i);
        }
        if (i >= _.length()) {
            return std::make_tuple(false, map_context, i);
        }
        if (is_context((*i_))) {
            map_context["$" + (*i_).substr(((*i_).find(f_[0]) + f_[0].length()) + 1, (*i_).find(symbol_of_context[1]) - (((*i_).find(f_[0]) + f_[0].length()) + 1))] = _.substr(i, must_ins(_, i + 1, 1, true) - i).substr(1, (_.substr(i, must_ins(_, i + 1, 1, true) - i).length()-2));
        }
        i = i + (is_context((*i_)) ? must_ins(_, i + 1, 1, true) - i : (*i_).length());
    }
    return std::make_tuple(true, map_context, i);
}

std::tuple<std::string, std::string> macro::var__macro(std::string t, char char_ign[ig__][2])
{
    std::function<std::string(char)> to_str = [](char _) {char x[2] = {_, '\0'}; return std::string(x); };
    std::string reserverd_name = "var_" + syntax_r[3];
    std::string esp, esp_;
    esp = char_ign[1][0];
    esp_ = char_ign[1][1];
    std::string str_ = (t.substr(t.find(esp) + 1, t.find(esp_) - (t.find(esp) + 1)));
    int _;
    do {
        for (int i = 0; i <= 5; i++) {
            if ((rand() % (1 + 1 - 0) + 0) == 0) {
                _ = rand() % (90 + 1 - 65) + 65;
            }
            else {
                _ = rand() % (122 + 1 - 97) + 97;
            }

            reserverd_name = reserverd_name + to_str((char)_);
        }
    } while (find(vars.begin(), vars.end(), reserverd_name) != vars.end());
    vars.push_back(reserverd_name);

    return std::make_tuple(str_.substr(str_.find(syntax_r[2]), str_.length() - str_.find(syntax_r[2])), reserverd_name);
}

std::tuple<std::string, int> macro::rule_macr(std::string __, int _, int p_, std::map<std::string, std::string> var_context, std::map<std::string, std::vector<std::string> > map_, char char_ign[ig__][2], const char* abstract_logic[__abs][2])
{
    std::string s, s_, s__;
    s = char_ign[1][0];
    s_ = char_ign[1][1];
    s__ = char_ign[0][0];
    auto g___macr = [&](std::string _) { return secure_string_format(_.substr(1, _.length() - 2)); };

    std::function<std::tuple<int, std::string>(std::string, int, void*, void*, void*, bool, std::function<int(int)>)> p_pos = [&](std::string t, int _, void* p_, void* iter_, void* b_, bool __, std::function<int(int)> _____) { return _ >= t.length() ? std::make_tuple(0, "") : (strcmp(t.substr(_, strlen(((char**)p_)[0])).c_str(), ((char**)p_)[0]) == 0 && __) ? std::make_tuple(_, std::string(((char**)p_)[0])) : (((char**)iter_)[0] == ((char**)p_)[0]) ? p_pos(t, _____(_), b_, iter_, b_, (t.substr(_, 1) == "\"" ? !__ : __), _____) : p_pos(t, _, ((char**)p_) + 2, iter_, b_, __, _____); };

    std::function<std::string(std::string, std::map<std::string, std::string>)>
        __apply_context = [&](std::string __, std::map<std::string, std::string> ex) {
            std::function<int(std::string, int, bool)> r_ = [&](std::string _, int __, bool ___) {
                return (__ >= _.length() || __ < 0) ? 0 : (_.substr(__, 1) == s_ && ___) ? __ : r_(_, __ + 1, (_.substr(__, 1) == s__) ? !___ : ___);
            };
            std::string t;
            bool p = true;
            for (int _ = 0; _ <= __.length(); _++) {
                if (__.substr(_, 2) == s + syntax_r[2] && p) {
                    t = __.substr(_, (r_(__, _, p) - _) + 1);
                    std::string str_ = (t.substr(t.find(s) + 1, t.find(s_) - (t.find(s) + 1)));
                    __ = __.substr(0, _) + ex[str_.substr(str_.find(syntax_r[2]), str_.length() - str_.find(syntax_r[2]))] + __.substr(r_(__, _, p) + 1, __.length() - (r_(__, _, p) + 1));
                    _ = _ + (ex[str_.substr(str_.find(syntax_r[2]), str_.length() - str_.find(syntax_r[2]))]).length();
                }
                p = (__.substr(_, 1) == s__) ? !p : p;
            }
            return __;
        };

    std::string __c;
    std::string __top, __down, __return;
    std::tuple<std::string, std::string> _t;
    std::vector<std::string> vec_ = map_["vars"];
    std::vector<std::string> top_ = map_["top"];
    std::vector<std::string> ret_ = map_["return"];
    std::vector<std::string> down_ = map_["down"];
    std::tuple<int, std::string> r, r_;
    int p__, ___ = _;
    if (ret_.size() > 1) {
        error_("MACRO", "DUPLICATE RETURN RULE OF MACRO", 0, MACRO_ERROR);
    }
    for (std::vector<std::string>::iterator it_ = vec_.begin(); it_ != vec_.end(); it_++) {
        _t = var__macro(*it_, char_ign);
        var_context[std::get<0>(_t)] = std::get<1>(_t);
    }
    for (std::vector<std::string>::iterator it_down = down_.begin(); it_down != down_.end(); it_down++) {
        __down = __down + __apply_context(g___macr(*it_down), var_context) + " ";
    }

    for (std::vector<std::string>::iterator it_top = top_.begin(); it_top != top_.end(); it_top++) {
        __top = __top + __apply_context(g___macr(*it_top), var_context) + " ";
    }

    if (ret_.size() > 0) {
        __return = __apply_context(g___macr(ret_[0]), var_context);
        __ = __.substr(0, _) + __return + __.substr(_ + p_, __.length() - (_ + p_));
    }

    if (top_.size() > 0) {
        r = p_pos(__, _, abstract_logic, abstract_logic[7], abstract_logic[0], true, (std::function<int(int)>)[](int y) { return y - 1; });
        p__ = __.length();
        __ = __.substr(0, std::get<0>(r)) + __top + __.substr(std::get<0>(r), __.length() - std::get<0>(r));
        _ = _ + (__.length() - p__);
        ___ = _;
        ___ = std::get<0>(r);
    }

    if (down_.size() > 0) {
        r = p_pos(__, _, abstract_logic, abstract_logic[7], abstract_logic[0], true, (std::function<int(int)>)[](int y) { return y + 1; });
        __ = __.substr(0, std::get<0>(r)) + __down + __.substr(std::get<0>(r), __.length() - (std::get<0>(r)));
    }

    return std::make_tuple(__, ___);
}

std::string macro::_macro(std::string __, std::vector<std::string> tok, char char_ign[ig__][2], std::map<std::string, std::vector<std::string> > rul_, const char* abstract_logic[__abs][2])
{
    std::string _;
    std::string c_;
    std::tuple<bool, std::map<std::string, std::string>, int> tup_mac_;
    std::tuple<std::string, int> macr___;
    for (int i = 0; i <= __.length(); i++) {
        tup_mac_ = is_mac(tok, __.substr(i, __.length() - i), char_ign);
        if (std::get<0>(tup_mac_)) {
            macr___ = rule_macr(__, i, std::get<2>(tup_mac_), std::get<1>(tup_mac_), rul_, char_ign, abstract_logic);
            __ = std::get<0>(macr___);
            i = std::get<1>(macr___);
        }
    }
    return __;
}

std::string macro::__macro(std::string s, const char* abstract_logic[__abs][2], char char_ign[ig__][2], std::string operators[len_op], std::string cond_ex[_cond_p])
{
    input = s;
    std::tuple<std::string, std::string> g_m = g_macro(s, abstract_logic);
    if (std::get<1>(g_m) == "") {
        return s;
    }
    input = std::get<0>(g_m);
    code_x = std::get<1>(g_m);
    srand(time(NULL));
    return load(abstract_logic, char_ign, operators, cond_ex);
}

std::string macro::load(const char* abstract_logic[__abs][2], char char_ign[ig__][2], std::string operators[len_op], std::string cond_ex[_cond_p])
{
    mac_ mac;
    std::vector<mac_> ____macro;
    std::vector<std::string> tok_ = tok(input, abstract_logic);
    for (std::vector<std::string>::iterator it = tok_.begin(); it != tok_.end(); it++) {
        mac.obj = g_syntax((*it), abstract_logic);
        mac.s_objs = syntax_tok(mac.obj, char_ign);
        mac.rule = macr_c((*it), char_ign);
        ____macro.push_back(mac);
    }

    for (std::vector<mac_>::iterator _ = ____macro.begin(); _ != ____macro.end(); _++) {
        code_x = _macro(code_x, (*_).s_objs, char_ign, (*_).rule, abstract_logic);
    }

    return code_x;
}
