
from libc.stdint cimport uint64_t
from libc.stdint cimport uint32_t
from libc.stdint cimport uint16_t
from libc.stdint cimport uint8_t
from libc.stdint cimport int64_t
from libc.stdint cimport int16_t
from libc.stdint cimport int32_t
from libc.stdint cimport int8_t

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/setup.h":
    ctypedef uint64_t u64
    ctypedef uint32_t u32
    ctypedef uint16_t u16
    ctypedef uint8_t u8
    ctypedef int64_t s64
    ctypedef int32_t s32
    ctypedef int16_t s16
    ctypedef int8_t s8