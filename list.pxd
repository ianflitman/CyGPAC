include "gptypes.pxd"

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/list.h":
    ctypedef struct GF_List:
        void **slots,
        u32 entryCount,
        u32 allocSize