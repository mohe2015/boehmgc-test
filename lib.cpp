#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <vector>
/*
#define GC_INCLUDE_NEW
#define GC_DEBUG
#include <gc/gc.h>
#include <gc/gc_cpp.h>
#include <gc/gc_allocator.h>
*/

// I think this is a false flag thing from the place where they fake-copy them
struct RegisterPrimOp
{
    struct Info
    {
        std::string name;
        std::vector<std::string> args;
        size_t arity = 0;
        const char * doc;
    };

    typedef std::vector<Info> PrimOps;
    static PrimOps * primOps;

    RegisterPrimOp(Info && info);
};

RegisterPrimOp::PrimOps * RegisterPrimOp::primOps;

RegisterPrimOp::RegisterPrimOp(Info && info)
{
    if (!primOps) primOps = new PrimOps;
    primOps->push_back(std::move(info));
}

static RegisterPrimOp test2({
    .name = "__pathExists",
    .args = {"path","flsdfhdsifsf","hdsflisdhfdsif","dslfihsfldfhs"},
    .doc = R"(
      Return `true` if the path *path* exists at evaluation time, and
      `false` otherwise.
    )",
});

int libtest() {
    //int *array = new int[100];
    //printf("%d",array[0]);

    return 7;
}