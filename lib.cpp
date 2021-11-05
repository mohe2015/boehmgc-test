#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <vector>

#define GC_INCLUDE_NEW
#define GC_DEBUG
#include <gc/gc.h>
#include <gc/gc_cpp.h>
#include <gc/gc_allocator.h>

struct Info : gc
{
    std::string name;
    std::vector<std::string> args; // mae vector is notf gc able and that's the problem
    size_t arity = 0;
    const char * doc;
};



int libtest() {
    //int *array = new int[100];
    //printf("%d",array[0]);

    Info* test = new Info({
        .args = {"path","flsdfhdsifsf","hdsflisdhfdsif","dslfihsfldfhs"},
    });

    return 7;
}