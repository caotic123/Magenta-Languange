#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//lib used for basic lib magente compiler
//this code is a just the version not compiled
//you don't need this version this code for compiler magenta but you can compile newlib if you want to
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
	int* ret = malloc(sizeof(int)*2);
	(*ret) = 1;
	printf("%s\n", str);
	return (void*)ret;
}

void* print_n(void* i) {
	int* ret = malloc(sizeof(int)*2);
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
	int* int_ = malloc(sizeof(int)*2);
	scanf("%d", int_);
	return (void*)int_;
}

//functions of magenta vectors
//theys functions just me remeber He-Man: "HEYEAYEA"
void* mag_alloc(void* len) {
	void** m = malloc(*(int*)len*sizeof(void*));
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

void* _get(void* vector, void* i) {
	return ((void**)vector)[*(int*)i];
}