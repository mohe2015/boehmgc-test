#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <vector>

#define GC_INCLUDE_NEW
#define GC_DEBUG
#include <gc/gc.h>
#include <gc/gc_cpp.h>
#include <gc/gc_allocator.h>

static std::vector<std::string> test2({"hello, it's me"});