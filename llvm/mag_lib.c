#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdarg.h>
#include <stdint.h> 
#include <math.h>
#if defined(unix) || defined(__unix__) || defined(__unix)
#include <sys/mman.h>
#endif
#if _WIN32
#include <windows.h>
#endif

int get_i(void* t) {
  double x;
  modf(*(double*)t, &x);
  return (int)x;
}

void* _abs(void* i) {
	double* r = malloc(sizeof(double));
	(*r) = fabs(*(double*)i);
	return (void*)r;
}

void* _ceil(void* i) {
	double* r = malloc(sizeof(double));
	(*r) = ceil(*(double*)i);
	return (void*)r;
}

void* _floor(void* i) {
	double* r = malloc(sizeof(double));
	(*r) = floor(*(double*)i);
	return (void*)r;
}

void* _pow(void* i, void* b) {
	double* r = malloc(sizeof(double));
	(*r) = pow(*(int*)i, *(double*)b);
	return (void*)r;
}

void* mod(void* n, void* y) {
   if (*(double*)n == 0 || *(double*)y == 0) {
	   double* ret = malloc(sizeof(double));
	   (*ret) = 0;
	   return (void*)ret;
   }

  double* r = malloc(sizeof(double));
  (*r) = get_i(n) % get_i(y);
  return (void*)r;
 }

void* print(char* str) {
	double* ret = malloc(sizeof(double));
	(*ret) = 1;
	printf("%s\n", str);
	return (void*)ret;
}

void* print_n(void* i) {
	double* ret = malloc(sizeof(double));
	(*ret) = 1;
	printf("%d\n", get_i(i));
	return (void*)ret;
}

void* print_f(void* i) {
	double* ret = malloc(sizeof(double));
	(*ret) = 1;
	printf("%f\n", *(double*)i);
	return (void*)ret;
}

void* scanf_insecure() {
	char* x = malloc(80);
	scanf("%79s", x);
	return x;
}

void* get_scanf_int_insecure() {
	double* d = malloc(sizeof(double));
	scanf("%lf", d);
	return (void*)d;
}

//functions of magenta vectors
//this function just me remeber He-Man: "HEYEAYEA"

void* mag_alloc(void* len) {
	void** m = malloc(get_i(len)*sizeof(void*));
	return (void*)m;
}

void* mag_realloc(void* len) {
	void** m = realloc(m, get_i(len)*sizeof(void*));
	return (void*)m;
}

void* _aloc(void* vector, void* i, void* space) {
	double* r = malloc(sizeof(double));
	(*r) = 0;
	((void**)vector)[get_i(i)] = malloc(get_i(space));
	return (void*)r;
}

void* _set(void* vector, void* i, void* r, void* len) {
	double* r_ = malloc(sizeof(double));
	(*r_) = 0;
	memcpy(((void**)vector)[get_i(i)], r, get_i(len));
	return (void*)r_;
}

void* _put(void* vector, void* i, void* r) {
	double* r_ = malloc(sizeof(double));
	(*r_) = 0;
	((void**)vector)[get_i(i)] = r;
	return (void*)r_;
}

void* _get(void* vector, void* i) {
	return ((void**)vector)[get_i(i)];
}

void* number() {
	double *p_ = malloc(sizeof(double));
	(*p_) = 0;
	return (void*)p_;
}

void* new_bool() {
	bool* p_ = malloc(sizeof(bool));
	(*p_) = true;
	return (void*)p_;
}

void* new_str(void* len) {
	double *p_ = malloc(sizeof(char)*get_i(len));
	return (void*)p_;
}

//function of string pattern

void* l_str(char* str) {
	double* r = malloc(sizeof(double));
	(*r) = (double)strlen(str);
	return (void*)r;
}

void* f_str(char* str, char* str_, void* r)
{
    bool t;
    int y = 0;
    int s = 0;
	void* return_ = malloc(sizeof(double));
	(*(double*)return_) = 0;
    for (int i = 0; i <= strlen(str); i++) {
        if (t && str[i] == str_[y]) {
            t = true;
            y++;
        }
        else {
            t = false;
            y = 0;
        }

        if (!t && (char)str[i] == (char)str_[0]) {
            t = true;
            y = y + 1;
        }

        if (y == strlen(str_)) {
            if (s >= get_i(r)) {
				(*(double*)return_) = i + 1;
                return return_;
            }
            s++;
            t = false;
            y = 0;
        }
    }

    return return_;
}

void* e_str(char* _, char* __) {
	bool* r_ = malloc(sizeof(bool));
	(*r_) = (strcmp(_, __) == 0) ? 1 : 0;
	return (void*)r_;
}

void* to_c(char* s) {
	double* r = malloc(sizeof(double));
	(*r) = (char)s[0];
	return (void*)r;
}

void* to_ch(void* _) {
	char* r = malloc(sizeof(char)*2);
	r[0] = (char)(get_i(_));
	r[1] = (char)0;
	return (void*)r;
}

void* g_str(void* str) {
	double* ___ = malloc(sizeof(double));
	(*___) = (double)strlen(str);
	return (void*)___;
}

void* ad_str(char* s, char* y) {
	strcat(s, y);
	return (void*)s;
}

void* p_str(char* s, char* y) {
	strcpy(s, y);
	return (void*)s;
}

void* em_str(char* s, char* y) {
	char* _ = malloc(sizeof(char));
	_[0] = '\0';
	strcpy(s, _);
	free(_);
	return (void*)s;
}

void* s_str(void* t, void* len) {
	char* buffer = malloc(sizeof(char)*(get_i(len)));
	sprintf(buffer, "%d", get_i(t));
	return (void*)buffer;
}

void* s__str(void* t, void* len) {
	char* buffer = malloc(sizeof(char)*(get_i(len)));
	sprintf(buffer, "%f", *(double*)t);
	return (void*)buffer;
}

void* t_str(char* s, char* y, void* _r) {
	char* buf__;
	int i = 0;
	char** r_ = malloc(i);
	buf__ = strtok(s, y);
	for(i=1; buf__ != NULL; i++) {
		r_ = realloc(r_, sizeof(char*)*i);
		r_[i-1] = malloc(strlen(buf__)-1);
		strncpy(r_[i-1], buf__, strlen(buf__)+1);
		buf__ = strtok(NULL, y);
	}
	
	(*(double*)_r) = (i-1);
	return (void*)r_;
}

void* c_str(char* y, void* t, void* a)
{
    int i = 0;
    int len;
    char* str = (char*)malloc(sizeof(char) * get_i(a) + 1);
    for (int s = get_i(t); s <= get_i(t)+get_i(a)-1; s++) {
        str[i] = y[s];
        i++;
    }
    
    str[i] = '\0';
  
    return (void*)str;
}

void* ch_str(char* s, void* i) {
	char* s_ = malloc(sizeof(char)*2);
	s_[0] = (char)get_i(i);
        s_[1] = '\0';
	strncat(s, s_, strlen(s)+2);
	free(s_);
	return (void*)s;
}

void* n_str(void *t, void* b_) {
	void* s = malloc(sizeof(double));
	(*(double*)s) = (double)strtol((char*)t, NULL, get_i(b_));
	if (s == NULL) {
		(*(double*)s) = 0;
	}
	
	return s;
}

//system functions
void* pause() {
	double* r = malloc(sizeof(double));
	(*r) = 0;
	system("pause");
	return r;
}

void* exit_() {
	double* r = malloc(sizeof(double));
	(*r) = 0;
	exit(1);
	return r;
}

//read and write file
void* read(char* name) {
  FILE *f_ = fopen(name, "rb");
  if (f_ == NULL) {
	  void* r = malloc(sizeof(double));
	  (*(double*)r) = 0;
	  return r;
  }
 
  fseek(f_, 0, SEEK_END);
  long s = ftell(f_);
  fseek(f_, 0, SEEK_SET);
  char *str = malloc(s + 1);
  fread(str, s, 1, f_);
  fclose(f_);
  str[s] = '\0';
  return (void*)str;
}

void* write(char* file, char* c__) {
	FILE* f_ = fopen(file, "w");
    void* r = malloc(sizeof(double));
	(*(double*)r) = 1;
	if (f_== NULL) {
	  void* r = malloc(sizeof(double));
	  (*(double*)r) = 0;
	  return r;
    }
	fputs(c__, f_);
	fclose(f_);
	return r;
}

// low level func of allocation memory
void* sys_dr__alloca(void* len) {
  
  void* b_;
  #if _WIN32 
  b_ = VirtualAlloc(0, get_i(len), MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
  #endif

  #if defined(unix) || defined(__unix__) || defined(__unix)
  b_ = mmap(NULL, get_i(len), PROT_READ|PROT_WRITE, MAP_ANON|MAP_SHARED, -1, 0);
  #endif
  
  return b_;
}

void* sys_dr__free(void* i, void* len) {
  #if _WIN32 
  VirtualFree(i, get_i(len), MEM_RELEASE);
  #endif

  #if defined(unix) || defined(__unix__) || defined(__unix)
  munmap(i, get_i(len));
  #endif
 
  return i;
}

void* sys_p(void* c, void *t, void* len) {
	memcpy(c, t, get_i(len)/1024);
	return c;
}

void* sys_acess(void* t) {
	void* t_ = (void*)(intptr_t)(get_i(t));
	return t_;
}

void* sys_t(void* _) {
	double* a = malloc(sizeof(double));
	(*a) = (double)(intptr_t)_;
	return a;
}
