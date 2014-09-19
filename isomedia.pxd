
include "isomedia_dev.pxd"

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/isomedia.h":

    ctypedef struct GF_ISOFile:
        GF_Err LastError,
        char *filename,
        GF_DataMap *movieFileMap
        char *finalName,
        #the file where we store edited samples (for READ_WRITE and WRITE mode only)
        GF_DataMap *editFileMap,
        #the interleaving time for dummy mode (in movie TimeScale)
        u32 interleavingTime
        u8 openMode,
        u8 storageMode,
        #if true 3GPP text streams are read as MPEG-4 StreamingText
        u8 convert_streaming_text,
        u8 is_jp2,
        GF_MovieBox *moov,
        GF_MediaDataBox *mdat,
        GF_FileTypeBox *brand,
        GF_ProgressiveDownloadBox *pdin,
        GF_MetaBox *meta,
        u32 FragmentsFlags, NextMoofNumber,
        bint first_moof_merged,
        GF_MovieFragmentBox *moof,
        #in WRITE mode, this is the current MDAT where data is written
        #in READ mode this is the last valid file position before a gf_isom_box_read failed
        u64 current_top_box_start,
        u64 segment_start,
        GF_List *moof_list,
        bint use_segments, moof_first, append_segment,
        GF_SegmentIndexBox *root_sidx;
        u64 root_sidx_offset,
        u32 root_sidx_index,
        bint is_index_segment,
        #this contains ALL the root boxes excepts fragments
        GF_List *TopBoxes,
        #default track for sync of MPEG4 streams - this is the first accessed stream without OCR info - only set in READ mode
        s32 es_id_default_sync


        GF_ISOFile *gf_isom_open(const char *filename, u32 openmode, const char *tmp_dir)
        GF_Err gf_isom_close(GF_ISOFile *the_file)
        const char *gf_isom_get_filename(GF_ISOFile *the_file)
        u64 gf_isom_get_duration(GF_ISOFile *the_file)
        u64 gf_isom_get_file_size(GF_ISOFile *the_file)
        #check if the file has a top styp box and returns the brand and version of the first styp found
        bint gf_isom_has_segment(GF_ISOFile *isofile, u32 *brand, u32 *version)