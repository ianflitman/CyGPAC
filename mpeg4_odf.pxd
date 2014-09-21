#include "isomedia_dev.pxd"
include "list.pxd"

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/mpeg4_odf.h":
    ctypedef struct GF_Descriptor:
        u8 tag

    ctypedef struct GF_IPMP_ToolList:
        u8 tag,
        #GF_Descriptor,
        GF_List *ipmp_tools

