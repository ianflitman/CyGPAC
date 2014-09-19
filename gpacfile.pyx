
cimport isomedia
from isomedia cimport GF_ISOFile
from isomedia cimport gf_isom_open
from isomedia cimport gf_isom_close
from tools cimport GF_Err

cdef class ISOFile:

    cdef GF_ISOFile *_file
    cdef GF_Err _err

    def __cinit__(self):
        self._file = NULL
        self._err = isomedia.GF_Err.GF_SCRIPT_NOT_READY


    def openfile (self,const char *filename, long long int openmode, const char *tmp_dir):
        self._file = gf_isom_open(filename, openmode, tmp_dir)


    def closefile (self):
        self._err = gf_isom_close(self._file)