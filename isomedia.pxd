
#include "isomedia_dev.pxd"
include "bitstream.pxd"
include "gptypes.pxd"
include "mpeg4_odf.pxd"
include "list.pxd"
include "tools.pxd"

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/internal/isomedia_dev.h":

    ctypedef struct GF_DataMap:
        int	type,
        u64	curPos,
        u8	mode,
        GF_BitStream *bs

    ctypedef struct GF_ISOM_BOX:
        u32 type,
        u64 size

    ctypedef GF_ISOM_BOX GF_Box

    ctypedef struct GF_ISOM_FULL_BOX:
        u8 version,
        u32 flags

    ctypedef struct GF_MovieHeaderBox:
        GF_ISOM_FULL_BOX fbox,
        u64 creationTime,
        u64 modificationTime,
        u32 timeScale,
        u64 duration,
        u32 nextTrackID,
        u32 preferredRate,
        u16 preferredVolume,
        char reserved[10],
        u32 matrixA,
        u32 matrixB,
        u32 matrixU,
        u32 matrixC,
        u32 matrixD,
        u32 matrixV,
        u32 matrixW,
        u32 matrixX,
        u32 matrixY,
        u32 previewTime,
        u32 previewDuration,
        u32 posterTime,
        u32 selectionTime,
        u32 selectionDuration,
        u32 currentTime

    ctypedef struct GF_ObjectDescriptorBox:
        GF_ISOM_FULL_BOX fbox,
        GF_Descriptor *descriptor

    ctypedef struct GF_UserDataBox:
        GF_ISOM_BOX box,
        GF_List *recordList

    ctypedef struct GF_MovieExtendsHeaderBox:
        GF_ISOM_FULL_BOX fbox,
        u64 fragment_duration

    ctypedef struct GF_MovieExtendsBox:
        GF_ISOM_BOX box,
        GF_List *TrackExList,
        GF_MovieExtendsHeaderBox *mehd,
        GF_ISOFile *mov

    ctypedef struct GF_HandlerBox:
        GF_ISOM_FULL_BOX fbox,
        u32 reserved1,
        u32 handlerType,
        u8 reserved2[12],
        char *nameUTF8

    ctypedef struct GF_PrimaryItemBox:
        GF_ISOM_FULL_BOX fbox,
        u16 item_ID

    ctypedef struct GF_DataReferenceBox:
        GF_ISOM_FULL_BOX fbox,
        GF_List *boxList

    ctypedef struct GF_DataInformationBox:
        GF_ISOM_BOX box,
        GF_DataReferenceBox *dref

    ctypedef struct GF_ItemLocationBox:
        GF_ISOM_FULL_BOX fbox,
        u8 offset_size,
        u8 length_size,
        u8 base_offset_size,
        GF_List *location_entries

    ctypedef struct GF_ItemProtectionBox:
        GF_ISOM_FULL_BOX fbox,
        GF_List *protection_information

    ctypedef struct GF_ItemInfoBox:
        GF_ISOM_FULL_BOX fbox,
        GF_List *item_infos

    ctypedef struct GF_IPMPControlBox:
        GF_ISOM_FULL_BOX fbox,
        GF_IPMP_ToolList *ipmp_tools,
        GF_List *descriptors

    ctypedef struct GF_MetaBox:
        GF_ISOM_FULL_BOX fbox,
        GF_HandlerBox *handler,
        GF_PrimaryItemBox *primary_resource,
        GF_DataInformationBox *file_locations,
        GF_ItemLocationBox *item_locations,
        GF_ItemProtectionBox *protections,
        GF_ItemInfoBox *item_infos,
        GF_IPMPControlBox *IPMP_control,
        GF_List *other_boxes

    ctypedef struct GF_MovieBox:
        GF_ISOM_BOX gfbox,
        GF_MovieHeaderBox *mvhd,
        GF_ObjectDescriptorBox *iods,
        GF_UserDataBox *udta,
        GF_MovieExtendsBox *mvex,
        GF_MetaBox *meta
        GF_List *trackList,
        #other boxes
        GF_List *boxes,
        GF_ISOFile *mov

    ctypedef struct GF_MediaDataBox:
        GF_ISOM_BOX box,
        #note: the data is NEVER loaded to the mdat in this lib
        u64 dataSize,
        char *data

    ctypedef struct GF_FileTypeBox:
        GF_ISOM_BOX box,
        u32 majorBrand,
        u32 minorVersion,
        u32 altCount,
        u32 *altBrand

    ctypedef struct GF_ProgressiveDownloadBox:
        GF_ISOM_FULL_BOX fbox,
        u32 *rates,
        u32 *times,
        u32 count

    ctypedef struct GF_MovieFragmentHeaderBox:
        GF_ISOM_FULL_BOX fbox,
        u32 sequence_number

    ctypedef struct GF_MovieFragmentBox:
        GF_ISOM_BOX box,
        GF_MovieFragmentHeaderBox *mfhd,
        GF_List *TrackList,
        GF_ISOFile *mov,
        #offset in the file of moof or mdat (whichever comes first) for this fragment
        u64 fragment_offset,
        u32 mdat_size,
        char *mdat

    ctypedef struct GF_SIDXReference:
        bint reference_type,
        u32 reference_size,
        u32 subsegment_duration,
        bint starts_with_SAP,
        u32 SAP_type,
        u32 SAP_delta_time

    ctypedef struct GF_SegmentIndexBox:
        GF_ISOM_FULL_BOX fbox,
        u32 reference_ID,
        u32 timescale,
        u64 earliest_presentation_time,
        u64 first_offset,
        u32 nb_refs,
        GF_SIDXReference *refs

    GF_ISOFile *gf_isom_create_movie(const char *fileName, u32 OpenMode, const char *tmp_dir)


cdef extern from "/home/ian/projects/tools/gpac/include/gpac/isomedia.h":
    ctypedef struct GF_ISOFile:
        GF_Err LastError,
        char *fileName,
        GF_DataMap *movieFileMap
        char *finalName
        # the file where we store edited samples (for READ_WRITE and WRITE mode only)
        GF_DataMap *editFileMap,
        # the interleaving time for dummy mode (in movie TimeScale)
        u32 interleavingTime
        u8 openMode,
        u8 storageMode,
        # if true 3GPP text streams are read as MPEG-4 StreamingText
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
        # in WRITE mode, this is the current MDAT where data is written
        # in READ mode this is the last valid file position before a gf_isom_box_read failed
        u64 current_top_box_start,
        u64 segment_start
        GF_List *moof_list,
        bint use_segments, moof_first, append_segment,
        GF_SegmentIndexBox *root_sidx,
        u64 root_sidx_offset,
        u32 root_sidx_index,
        bint is_index_segment,
        # this contains ALL the root boxes excepts fragments
        GF_List *TopBoxes,
        # default track for sync of MPEG4 streams - this is the first accessed stream without OCR info - only set in READ mode
        s32 es_id_default_sync


    GF_ISOFile *gf_isom_open(const char *filename, u32 openmode, const char *tmp_dir)
    GF_Err gf_isom_close(GF_ISOFile *the_file)
    const char *gf_isom_get_filename(GF_ISOFile *the_file)
    u64 gf_isom_get_duration(GF_ISOFile *the_file)
    u32 gf_isom_get_track_count(GF_ISOFile *the_file)
    u64 gf_isom_get_file_size(GF_ISOFile *the_file)
    u32 gf_isom_get_timescale(GF_ISOFile *the_file)
    void gf_isom_delete(GF_ISOFile *the_file)
    #GF_ISOFile *gf_isom_create_movie(const char *filename, u32 openmode, const char *tmp_dir)

    #check if the file has a top styp box and returns the brand and version of the first styp found
    bint gf_isom_has_segment(GF_ISOFile *isofile, u32 *brand, u32 *version)