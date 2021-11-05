#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <vector>

int libtest();

#define GC_INCLUDE_NEW
#define GC_DEBUG
#include <gc/gc.h>
#include <gc/gc_cpp.h>
#include <gc/gc_allocator.h>

int main(int argc, char** argv) {  
    libtest();

    GC_gcollect();

    return 0;
}