#include <stdio.h>
#include <stdlib.h>

/*
#define GC_INCLUDE_NEW
#define GC_DEBUG
#include <gc/gc.h>
#include <gc/gc_cpp.h>
#include <gc/gc_allocator.h>
*/

int main(int argc, char** argv) {
    char * buffer = (char*)malloc(1024);
    sprintf(buffer, "%d", argc);
    printf("%s",buffer);

    return 0;
}