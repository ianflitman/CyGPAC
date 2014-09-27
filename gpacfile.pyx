
from isomedia cimport GF_ISOFile
from isomedia cimport gf_isom_open
from isomedia cimport gf_isom_close
from isomedia cimport gf_isom_get_filename
from isomedia cimport gf_isom_get_duration
from isomedia cimport gf_isom_get_track_count
from isomedia cimport gf_isom_get_timescale
from isomedia cimport gf_isom_create_movie
from isomedia cimport gf_isom_delete
from isomedia cimport gf_isom_get_file_size
from gptypes cimport u32
from tools cimport GF_Err
cimport tools

cdef class ISOFile:

    cdef GF_ISOFile *_file
    cdef GF_Err _err

    def __cinit__(self):
        self._file = NULL
        self._err = tools.GF_IP_ADDRESS_NOT_FOUND


    def open (self,const char *filename, u32 openmode, const char *tmp_dir):
        self._file = gf_isom_open(filename, openmode, tmp_dir)
        if self._file is NULL:
            self._err = tools.GF_STREAM_NOT_FOUND
            print "file did not open"


    def close (self):
        if self._file is NULL:
            return -1
        else:
            self._err = gf_isom_close(self._file)
            self._file = NULL


    def create(self,const char *filename, u32 openmode, const char *tmp_dir):
        if self._file is NULL:
            self._file = gf_isom_create_movie(filename, openmode,tmp_dir)
        else:
            print "closing then deleting existing file"
            self.close()
            self.delete()
            self._file = gf_isom_create_movie(filename, openmode,tmp_dir)


    def delete(self):
        if self._file is NULL:
            print "no file"
        else:
            gf_isom_delete(self._file)


    property error:
        def __get__(self):
            return self._err

    property filename:
        def __get__(self):
            if self._file is NULL:
                return -1
            else:
                return  gf_isom_get_filename(self._file)

    property duration:
        def __get__(self):
            if self._file is NULL:
                return -1
            else:
                return gf_isom_get_duration(self._file)


    property timescale:
        def __get__(self):
            if self._file is NULL:
                return -1
            else:
                return gf_isom_get_timescale(self._file)


    property trackCount:
        def __get__(self):
            if self._file is NULL:
                return -1
            else:
                return gf_isom_get_track_count(self._file)


    property filesize:
        def __get__(self):
            if self._file is NULL:
                return -1
            else:
                return gf_isom_get_file_size(self._file)


