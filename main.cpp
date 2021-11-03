#include <stdio.h>
#include <stdlib.h>

#define GC_DEBUG
#include <gc/gc.h>
#include <gc/gc_cpp.h>
#include <gc/gc_allocator.h>

int main(int argc, char** argv) {
    char *array = new char[100];
    sprintf(array, "%d", argc);
    printf("%s",array);

    GC_gcollect();

    return 0;
}