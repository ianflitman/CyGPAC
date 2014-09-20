from gpactypes cimport u32
cimport tools
from tools cimport GF_Err


cdef GF_Err err():
    return tools.GF_IO_ERR

cdef u32 addints(u32 a, u32 b):
    return a + b