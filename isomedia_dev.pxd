include "tools.pxd"
include "bitstream.pxd"
include "mpeg4_odf.pxd"
include "list.pxd"
include "isomedia.pxd"

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/internal/isomedia_dev.h":

    ctypedef struct GF_DataMap:
        pass
        int	type,
        u64	curPos,
        u8	mode,
        GF_BitStream *bs

    ctypedef struct GF_Box:
        GF_ISOM_BOX

    ctypedef struct GF_ISOM_BOX:
        u32 type,
        u64 size

    ctypedef struct GF_ISOM_FULL_BOX:
        u8 version,
        u32 flags

    ctypedef struct GF_MovieHeaderBox:
        GF_ISOM_FULL_BOX,
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
        GF_ISOM_FULL_BOX,
        GF_Descriptor *descriptor

    ctypedef struct GF_UserDataBox:
        GF_ISOM_BOX,
        GF_List *recordList

    ctypedef struct GF_MovieExtendsHeaderBox:
        GF_ISOM_FULL_BOX,
        u64 fragment_duration

    ctypedef struct GF_MovieExtendsBox:
        GF_ISOM_BOX,
        GF_List *TrackExList,
        GF_MovieExtendsHeaderBox *mehd,
        GF_ISOFile *mov

    ctypedef struct GF_HandlerBox:
        GF_ISOM_FULL_BOX,
        u32 reserved1,
        u32 handlerType,
        u8 reserved2[12],
        char *nameUTF8

    ctypedef struct GF_PrimaryItemBox:
        GF_ISOM_FULL_BOX,
        u16 item_ID

    ctypedef struct GF_DataReferenceBox:
        GF_ISOM_FULL_BOX,
        GF_List *boxList

    ctypedef struct GF_DataInformationBox:
        GF_ISOM_BOX,
        GF_DataReferenceBox *dref

    ctypedef struct GF_ItemLocationBox:
        GF_ISOM_FULL_BOX,
        u8 offset_size,
        u8 length_size,
        u8 base_offset_size,
        GF_List *location_entries

    ctypedef struct GF_ItemProtectionBox:
        GF_ISOM_FULL_BOX,
        GF_List *protection_information

    ctypedef struct GF_ItemInfoBox:
        GF_ISOM_FULL_BOX,
        GF_List *item_infos

    ctypedef struct GF_IPMPControlBox:
        GF_ISOM_FULL_BOX
        GF_IPMP_ToolList *ipmp_tools,
        GF_List *descriptors;

    ctypedef struct GF_MetaBox:
        GF_ISOM_FULL_BOX,
        GF_HandlerBox *handler,
        GF_PrimaryItemBox *primary_resource,
        GF_DataInformationBox *file_locations,
        GF_ItemLocationBox *item_locations,
        GF_ItemProtectionBox *protections,
        GF_ItemInfoBox *item_infos,
        GF_IPMPControlBox *IPMP_control,
        GF_List *other_boxes


    ctypedef struct GF_MovieBox:
        GF_ISOM_BOX,
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
        GF_ISOM_BOX,
        #note: the data is NEVER loaded to the mdat in this lib
        u64 dataSize,
        char *data

    ctypedef struct GF_FileTypeBox:
        GF_ISOM_BOX,
        u32 majorBrand,
        u32 minorVersion,
        u32 altCount,
        u32 *altBrand

    ctypedef struct GF_ProgressiveDownloadBox:
        GF_ISOM_FULL_BOX,
        u32 *rates,
        u32 *times,
        u32 count

    ctypedef struct GF_MovieFragmentHeaderBox:
        GF_ISOM_FULL_BOX
        u32 sequence_number

    ctypedef struct GF_MovieFragmentBox:
        GF_ISOM_BOX,
        GF_MovieFragmentHeaderBox *mfhd,
        GF_List *TrackList,
        GF_ISOFile *mov;
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
        GF_ISOM_FULL_BOX,
        u32 reference_ID,
        u32 timescale,
        u64 earliest_presentation_time,
        u64 first_offset,
        u32 nb_refs,
        GF_SIDXReference *refs;

    GF_ISOFile *gf_isom_new_movie()


