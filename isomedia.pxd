
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

    ctypedef struct GF_SttsEntry:
        u32 sampleCount,
        u32 sampleDelta

    ctypedef struct GF_TimeToSampleBox:
        GF_ISOM_FULL_BOX fbox,
        GF_SttsEntry *entries,
        u32 nb_entries,
        u32 alloc_size,
        #cache for WRITE
        u32 w_currentSampleNum,
        u64 w_LastDTS,
        #cache for READ
        u32 r_FirstSampleInEntry,
        u32 r_currentEntryIndex,
        u64 r_CurrentDTS

    ctypedef struct GF_StscEntry:
        u32 firstChunk,
        u32 nextChunk,
        u32 samplesPerChunk,
        u32 sampleDescriptionIndex,
        u8 isEdited

    ctypedef struct GF_StsfEntry:
        u32 SampleNumber,
        u32 fragmentCount,
        u16 *fragmentSizes

    ctypedef struct GF_SampleFragmentBox:
        GF_ISOM_FULL_BOX fbox,
        GF_List *entryList,
        #cache for write
        GF_StsfEntry *w_currentEntry,
        u32 w_currentEntryIndex,
        #cache for read
        u32 r_currentEntryIndex,
        GF_StsfEntry *r_currentEntry

    ctypedef struct GF_TrackReferenceBox:
        GF_ISOM_BOX box,
        GF_List *boxList

    ctypedef struct GF_MediaHeaderBox:
        GF_ISOM_FULL_BOX fbox,
        u64 creationTime,
        u64 modificationTime,
        u32 timeScale,
        u64 duration,
        char packedLanguage[4],
        u16 reserved

    ctypedef struct GF_DttsEntry:
        u32 sampleCount,
        s32 decodingOffset

    ctypedef struct GF_CompositionOffsetBox:
        GF_ISOM_BOX box,
        GF_DttsEntry *entries,
        u32 nb_entries, alloc_size,
        u32 w_LastSampleNumber,
        #force one sample per entry
        bint unpack_mode,
        #cache for read
        u32 r_currentEntryIndex,
        u32 r_FirstSampleInEntry

    ctypedef struct GF_CompositionToDecodeBox:
        GF_ISOM_FULL_BOX fbox,
        s32 compositionToDTSShift,
        s32 leastDecodeToDisplayDelta,
        s32 greatestDecodeToDisplayDelta,
        s32 compositionStartTime,
        s32 compositionEndTime

    ctypedef struct GF_SyncSampleBox:
        GF_ISOM_FULL_BOX fbox,
        u32 alloc_size, nb_entries,
        u32 *sampleNumbers,
        #cache for READ mode (in write we realloc no matter what)
        u32 r_LastSyncSample;
        #0-based index in the array
        u32 r_LastSampleIndex,
        u32 *sampleNumbers,
        #cache for READ mode (in write we realloc no matter what)
        u32 r_LastSyncSample,
        #0-based index in the array
        u32 r_LastSampleIndex

    ctypedef struct GF_SampleDescriptionBox:
        GF_ISOM_FULL_BOX fbox

    ctypedef struct GF_SampleSizeBox:
        #if this is the compact version, sample size is actually fieldSize
        u32 sampleSize,
        u32 sampleCount,
        u32 alloc_size,
        u32 *sizes

    ctypedef struct GF_SampleToChunkBox:
        GF_ISOM_FULL_BOX fbox,
        GF_StscEntry *entries,
        u32 alloc_size, nb_entries,
        #0-based cache for READ. In WRITE mode, we always have 1 sample per chunk so no need for a cache
        u32 currentIndex,
        #first sample number in this chunk
        u32 firstSampleInCurrentChunk,
        u32 currentChunk,
        u32 ghostNumber

    ctypedef struct GF_ShadowSyncBox:
        GF_ISOM_FULL_BOX fbox,
        GF_List *entries,
        #Cache for read mode
        u32 r_LastEntryIndex,
        u32 r_LastFoundSample


    ctypedef struct GF_DegradationPriorityBox:
        GF_ISOM_FULL_BOX fbox,
        u32 nb_entries,
        u16 *priorities

    ctypedef struct GF_PaddingBitsBox:
        GF_ISOM_FULL_BOX fbox,
        u32 SampleCount,
        u8 *padbits

    ctypedef struct GF_SampleDependencyTypeBox:
        GF_ISOM_FULL_BOX fbox,
        u32 sampleCount,
        #each dep type is packed on 1 byte
        u8 *sample_info;

    ctypedef struct GF_SubSampleInformationBox:
        GF_ISOM_FULL_BOX fbox,
        GF_List *Samples

    ctypedef struct GF_SampleTableBox:
        GF_ISOM_BOX box,
        GF_TimeToSampleBox *TimeToSample,
        GF_CompositionOffsetBox *CompositionOffset,
        GF_CompositionToDecodeBox *compositionToDecode,
        GF_SyncSampleBox *SyncSample,
        GF_SampleDescriptionBox *SampleDescription,
        GF_SampleSizeBox *SampleSize,
        GF_SampleToChunkBox *SampleToChunk,
        #untyped, to handle 32 bits and 64 bits chunkOffsets
        GF_Box *ChunkOffset,
        GF_ShadowSyncBox *ShadowSync,
        GF_PaddingBitsBox *PaddingBits,
        GF_SampleDependencyTypeBox *SampleDep,
        GF_SampleFragmentBox *Fragments,
        GF_SubSampleInformationBox *SubSamples
        GF_List *sampleGroups,
        GF_List *sampleGroupsDescription,
        GF_List *sai_sizes,
        GF_List *sai_offsets,
        u32 MaxSamplePerChunk,
        u16 groupID,
        u16 trackPriority,
        u32 currentEntryIndex

    ctypedef struct GF_DataMap:
        u8	type,
        u64	curPos,
        u8	mode,
        GF_BitStream *bs

    ctypedef struct GF_MediaInformationBox:
        GF_ISOM_BOX box,
        GF_DataInformationBox *dataInformation,
        GF_SampleTableBox *sampleTable,
        GF_Box *InfoHeader,
        GF_DataMap *dataHandler,
        u32 dataEntryIndex


    ctypedef struct GF_MediaBox:
        GF_ISOM_BOX box,
        GF_TrackBox *mediaTrack
        GF_MediaHeaderBox *mediaHeader
        GF_HandlerBox *handler,
        GF_MediaInformationBox *information,
        u64 BytesMissing

    ctypedef struct GF_EditListBox:
        GF_ISOM_FULL_BOX fbox,
        GF_List *entryList

    ctypedef struct GF_EditBox:
        GF_ISOM_BOX box,
        GF_EditListBox *editList

    ctypedef struct GF_TrackHeaderBox:
        GF_ISOM_FULL_BOX fbox,
        u64 creationTime,
        u64 modificationTime,
        u32 trackID,
        u32 width, height,
        u32 reserved1,
        u64 duration,
        u32 reserved2[2],
        u16 layer,
        u16 alternate_group,
        u16 volume,
        u16 reserved3,
        u32 matrix[9]

    ctypedef struct GF_TrackBox:
        GF_ISOM_BOX box,
        GF_UserDataBox *udata,
        GF_TrackHeaderBox *Header,
        GF_MediaBox *Media,
        GF_EditBox *editBox,
        GF_TrackReferenceBox *References
        GF_MetaBox *meta,
        #other
        GF_List *boxes,
        GF_MovieBox *moov,
        #private for media padding*
        u32 padding_bytes,
        #private for editing
        char *name,
        #private for editing*/
        bint is_unpacked,
        u64 dts_at_seg_start,
        u32 sample_count_at_seg_start


    GF_ISOFile *gf_isom_create_movie(const char *fileName, u32 OpenMode, const char *tmp_dir)
    GF_Box *ftyp_New()
    void ftyp_del(GF_Box *s)
    GF_Err ftyp_Read(GF_Box *s,GF_BitStream *bs)
    GF_Err ftyp_Write(GF_Box *s, GF_BitStream *bs)
    GF_Err ftyp_Size(GF_Box *s)
    void tfdt_del(GF_Box *)
    GF_Err tfdt_Write(GF_Box *s, GF_BitStream *bs)
    GF_Err tfdt_Size(GF_Box *s)
    GF_Err tfdt_Read(GF_Box *s, GF_BitStream *bs)
    GF_Err tfdt_dump(GF_Box *a, FILE * trace)
    GF_Err moof_Write(GF_Box *s, GF_BitStream *bs)
    GF_Err moof_Read(GF_Box *s, GF_BitStream *bs)
    GF_Err moof_dump(GF_Box *a, FILE * trace)
    void moof_del(GF_Box *s)
    GF_Box *moof_New()

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
        u8 ooorageMode,
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
    # returns 1 if one sample of the track is found to have a composition time offset (DTS<CTS)
    bint gf_isom_has_time_offset(GF_ISOFile *the_file, u32 trackNumber)
    # check if the file has a top styp box and returns the brand and version of the first styp found
    bint gf_isom_has_segment(GF_ISOFile *isofile, u32 *brand, u32 *version)
    # Get the desired segment information
    GF_Err gf_isom_get_edit_segment(GF_ISOFile *the_file, u32 trackNumber, u32 SegmentIndex, u64 *EditTime, u64 *SegmentDuration, u64 *MediaTime, u8 *EditMode)
    # update or insert a new edit segment in the track time line. Edits are used to modify
    # the media normal timing. EditTime and EditDuration are expressed in Movie TimeScale
    # If a segment with EditTime already exists, IT IS ERASED
    # if there is a segment before this new one, its duration is adjust to match EditTime of
    # the new segment
    # WARNING: The first segment always have an EditTime of 0. You should insert an empty or dwelled segment first.
    GF_Err gf_isom_set_edit_segment(GF_ISOFile *the_file, u32 trackNumber, u64 EditTime, u64 EditDuration, u64 MediaTime, u8 EditMode)
    # same as above except only modifies duartion type and mediaType
    GF_Err gf_isom_modify_edit_segment(GF_ISOFile *the_file, u32 trackNumber, u32 seg_index, u64 EditDuration, u64 MediaTime, u8 EditMode);
    # same as above except only appends new segment
    GF_Err gf_isom_append_edit_segment(GF_ISOFile *the_file, u32 trackNumber, u64 EditDuration, u64 MediaTime, u8 EditMode);
    # remove the edit segments for the whole track
    GF_Err gf_isom_remove_edit_segments(GF_ISOFile *the_file, u32 trackNumber);
    # remove the given edit segment (1-based index). If this is not the last segment, the next segment duration
    # is updated to maintain a continous timeline*/
    GF_Err gf_isom_remove_edit_segment(GF_ISOFile *the_file, u32 trackNumber, u32 seg_index);