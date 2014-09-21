from gptypes cimport u32
cimport tools
from tools cimport GF_Err
cimport isomedia
from isomedia cimport GF_ISOFile
from  isomedia cimport gf_isom_open



cpdef GF_Err err():
    return tools.GF_IO_ERR

cpdef u32 addints(u32 a, u32 b):
    return a + b

def printmsg(msg):
    print msg

cdef GF_ISOFile * open(const char *filename, u32 openmode, const char *tmpdir):
    return gf_isom_open(filename, openmode, tmpdir)