include "gpactypes.pxd"
from libc.stdio cimport FILE

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/bitstream.h":
    ctypedef struct GF_BitStream:
        FILE *stream,
        char *original,
        u64 size,
        u64 position,
        u32 current,
        u32 nbBits,
        u32 bsmode
