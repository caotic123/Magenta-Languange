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

void* _abs(void* i) {
	int* r = malloc(sizeof(int));
	(*r) = abs(*(int*)i);
	return (void*)r;
}

void* _ceil(void* i) {
	int* r = malloc(sizeof(int));
	(*r) = ceil(*(int*)i);
	return (void*)r;
}

void* _floor(void* i) {
	int* r = malloc(sizeof(int));
	(*r) = floor(*(int*)i);
	return (void*)r;
}

void* _pow(void* i, void* b) {
	int* r = malloc(sizeof(int));
	(*r) = pow(*(int*)i, *(int*)b);
	return (void*)r;
}

void* mod(void* n, void* y) {
   if (*(int*)n == 0 || *(int*)y == 0) {
	   int* ret = malloc(sizeof(int));
	   (*ret) = 0;
	   return (void*)ret;
   }
  int* r = malloc(sizeof(int));
  (*r) = *(int*)n % *(int*)y;
  return (void*)r;
 }

void* print(char* str) {
	int* ret = malloc(sizeof(int));
	(*ret) = 1;
	printf("%s\n", str);
	return (void*)ret;
}

void* print_n(void* i) {
	int* ret = malloc(sizeof(int));
	(*ret) = 1;
	printf("%d\n", *(int*)i);
	return (void*)ret;
}

void* scanf_insecure() {
	char* x = malloc(80);
	scanf("%79s", x);
	return x;
}

void* get_scanf_int_insecure() {
	int* int_ = malloc(sizeof(int));
	scanf("%d", int_);
	return (void*)int_;
}


//functions of magenta vectors
//this function just me remeber He-Man: "HEYEAYEA"

void* mag_alloc(void* len) {
	void** m = malloc(*(int*)len*sizeof(void*));
	return (void*)m;
}

void* mag_realloc(void* len) {
	void** m = realloc(m, *(int*)len*sizeof(void*));
	return (void*)m;
}

void* _aloc(void* vector, void* i, void* space) {
	int* r = malloc(sizeof(int));
	(*r) = 0;
	((void**)vector)[*(int*)i] = malloc(*(int*)space);
	return (void*)r;
}

void* _set(void* vector, void* i, void* r, void* len) {
	int* r_ = malloc(sizeof(int));
	(*r_) = 0;
	memcpy(((void**)vector)[*(int*)i], r, *(int*)len);
	return (void*)r_;
}

void* _put(void* vector, void* i, void* r) {
	int* r_ = malloc(sizeof(int));
	(*r_) = 0;
	((void**)vector)[*(int*)i] = r;
	return (void*)r_;
}

void* _get(void* vector, void* i) {
	return ((void**)vector)[*(int*)i];
}

void* new_int() {
	int *p_ = malloc(sizeof(int));
	(*p_) = 0;
	return (void*)p_;
}

void* new_bool() {
	bool* p_ = malloc(sizeof(bool));
	(*p_) = true;
	return (void*)p_;
}

void* new_str(void* len) {
	int *p_ = malloc(sizeof(char)*(*(int*)len));
	return (void*)p_;
}

//function of string pattern

void* l_str(char* str) {
	int* r = malloc(sizeof(int));
	(*r) = strlen(str);
	return (void*)r;
}

void* f_str(char* str, char* str_, void* r)
{
    bool t;
    int y = 0;
    int s = 0;
	void* return_ = malloc(sizeof(int));
	(*(int*)return_) = 0;
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
            if (s >= *(int*)r) {
				(*(int*)return_) = i + 1;
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
	int* r = malloc(sizeof(int));
	(*r) = (char)s[0];
	return (void*)r;
}

void* to_ch(void* _) {
	char* r = malloc(sizeof(char)*2);
	r[0] = (char)(*(int*)_);
	r[1] = '/0';
	return (void*)r;
}

void* g_str(void* str) {
	int* ___ = malloc(sizeof(int));
	(*___) = strlen(str);
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
	char* buffer = malloc(sizeof(char)*(*(int*)len));
	sprintf(buffer, "%d", *(int*)t);
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
	
	(*(int*)_r) = (i-1);
	return (void*)r_;
}

void* c_str(char* y, void* t, void* a)
{
    int i = 0;
    int len;
    char* str = (char*)malloc(sizeof(char) * (*(int*)a) + 1);
    for (int s = (*(int*)t); s <= ((*(int*)t)+(*(int*)a))-1; s++) {
        str[i] = y[s];
        i++;
    }
    
    str[i] = '\0';
  
    return (void*)str;
}

void* ch_str(char* s, void* i) {
	char* s_ = malloc(sizeof(char)*2);
	s_[0] = (char)(*(int*)i);
    s_[1] = '\0';
	strncat(s, s_, strlen(s)+2);
	free(s_);
	return (void*)s;
}

void* n_str(void *t, void* b_) {
	void* s = malloc(sizeof(int));
	(*(int*)s) = strtol((char*)t, NULL, *(int*)b_);
	if (s == NULL) {
		(*(int*)s) = 0;
	}
	
	return s;
}

//system functions
void* pause() {
	int* r = malloc(sizeof(int));
	(*r) = 0;
	system("pause");
	return r;
}

void* exit_() {
	int* r = malloc(sizeof(int));
	(*r) = 0;
	exit(1);
	return r;
}

//read and write file
void* read(char* name) {
  FILE *f_ = fopen(name, "rb");
  if (f_ == NULL) {
	  void* r = malloc(sizeof(int));
	  (*(int*)r) = 0;
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
    void* r = malloc(sizeof(int));
	(*(int*)r) = 1;
	if (f_ == NULL) {
	  void* r = malloc(sizeof(int));
	  (*(int*)r) = 0;
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
  b_ = VirtualAlloc(0, *(int*)len, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
  #endif

  #if defined(unix) || defined(__unix__) || defined(__unix)
  b_ = mmap(NULL, *(int*)len, PROT_READ|PROT_WRITE, MAP_ANON|MAP_SHARED, -1, 0);
  #endif
  
  return b_;
}

void* sys_dr__free(void* i, void* len) {
  #if _WIN32 
  VirtualFree(i, 0, MEM_RELEASE);
  #endif

  #if defined(unix) || defined(__unix__) || defined(__unix)
  munmap(i, *(int*)len);
  #endif
 
  return i;
}

void* sys_p(void* c, void *t, void* len) {
	memcpy(c, t, (*(int*)len)/1024);
	return c;
}

void* sys_acess(void* t) {
	void* t_ = (void*)(intptr_t) (*(int*)t);
	return t_;
}

void* sys_t(void* _) {
	int* a = malloc(sizeof(int));
	(*a) = (int)(intptr_t)_;
	return a;
}
