
cimport isomedia
from isomedia cimport GF_ISOFile
#from isomedia cimport gf_isom_open
from isomedia cimport gf_isom_close
from gptypes cimport u32
#from tools cimport GF_Err
cimport tools

cdef class ISOFile:

    cdef GF_ISOFile *_file
    cdef tools.GF_Err _err

    def __cinit__(self):
        self._file = NULL
        self._err = tools.GF_IP_ADDRESS_NOT_FOUND


    def openfile (self,const char *filename, u32 openmode, const char *tmp_dir):
        #return isomedia.gf_isom_open(filename, openmode, tmp_dir)
        self._file = isomedia.gf_isom_open(filename, openmode, tmp_dir)
        #print self._file.filename


    def closefile (self):
        self._err = gf_isom_close(self._file)