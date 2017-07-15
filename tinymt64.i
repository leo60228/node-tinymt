%module tinymt64
%include <windows.i>

%{
extern "C" {
#include "tinymt/tinymt/tinymt64.h"
}
%}

%include "tinymt/tinymt/tinymt64.h"

%extend TINYMT64_T {
TINYMT64_T(double seed) {
TINYMT64_T *inst;
inst = (TINYMT64_T *) malloc(sizeof(TINYMT64_T));
tinymt64_init(inst, seed);
return inst;
}

TINYMT64_T(double* init_key, int key_length) {
TINYMT64_T *inst;

std::vector<uint64_t> vec;

for (int i = 0; i < key_length; i++) {
vec.push_back(init_key[i]);
}

inst = (TINYMT64_T *) malloc(sizeof(TINYMT64_T));
tinymt64_init_by_array(inst, &vec[0], key_length);
return inst;
}

~TINYMT64_T() {
}

double get_mexp() {
return tinymt64_get_mexp($self);
}

double generate_uint64() {
return tinymt64_generate_uint64($self);
}

double generate_double() {
return tinymt64_generate_double($self);
}

double generate_double12() {
return tinymt64_generate_double12($self);
}

double generate_double01() {
return tinymt64_generate_double01($self);
}

double generate_doubleOC() {
return tinymt64_generate_doubleOC($self);
}

double generate_doubleOO() {
return tinymt64_generate_doubleOO($self);
}
}
