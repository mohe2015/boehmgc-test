#include <stdio.h>
#include <stdlib.h>

#define GC_INCLUDE_NEW
#define GC_DEBUG
#include <gc/gc.h>
#include <gc/gc_cpp.h>
#include <gc/gc_allocator.h>

struct LoL : gc {
    int test;
};

int main(int argc, char** argv) {
    LoL *array = new LoL[100];
    printf("%d",array[0].test);

#if defined(__has_feature)
# if __has_feature(address_sanitizer) && !defined(ADDRESS_SANITIZER)
    printf ("We has ASAN!\n");
# else
    printf ("We have has_feature, no ASAN!\n");
# endif
#else
    printf ("We got nothing!\n");
#endif

    GC_gcollect();

    return 0;
}