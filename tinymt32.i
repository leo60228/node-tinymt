%module tinymt32
%include <windows.i>

%{
#include <vector>
extern "C" {
#include "tinymt/tinymt/tinymt32.h"
}
%}

%include "tinymt/tinymt/tinymt32.h"

%extend TINYMT32_T {
TINYMT32_T(double seed) {
TINYMT32_T *inst;
inst = (TINYMT32_T *) malloc(sizeof(TINYMT32_T));
tinymt32_init(inst, seed);
return inst;
}

TINYMT32_T(double* init_key, int key_length) {
TINYMT32_T *inst;

std::vector<uint32_t> vec;

for (int i = 0; i < key_length; i++) {
vec.push_back(init_key[i]);
}

inst = (TINYMT32_T *) malloc(sizeof(TINYMT32_T));
tinymt32_init_by_array(inst, &vec[0], key_length);
return inst;
}

~TINYMT32_T() {
free($self);
}

double get_mexp() {
return tinymt32_get_mexp($self);
}

double generate_uint32() {
return tinymt32_generate_uint32($self);
}

double generate_float() {
return tinymt32_generate_float($self);
}

double generate_float12() {
return tinymt32_generate_float12($self);
}

double generate_float01() {
return tinymt32_generate_float01($self);
}

double generate_floatOC() {
return tinymt32_generate_floatOC($self);
}

double generate_floatOO() {
return tinymt32_generate_floatOO($self);
}

double generate_32double() {
return tinymt32_generate_32double($self);
}
}
