include "gptypes.pxd"
include "list.pxd"

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/internal/mpd.h":
    
    ctypedef enum GF_MPD_Type:
        GF_MPD_TYPE_STATIC,
        GF_MPD_TYPE_DYNAMIC

    ctypedef struct GF_MPD:
        char *ID,
        char *profiles,
        u64 availabilityStartTime, #MANDATORY if type=dynamic
        u64 availabilityEndTime,
        u32 media_presentation_duration, # expressed in milliseconds *MANDATORY if type=static
        u32 minimum_update_period, # expressed in milliseconds
        u32 min_buffer_time,
        u32 time_shift_buffer_depth, # expressed in milliseconds
        u32 suggested_presentaton_delay, # expressed in milliseconds
        u32 max_segment_duration, # expressed in milliseconds
        u32 max_subsegment_duration,
        GF_List *program_infos,
        #list of GF_MPD_BaseURL
        GF_List *base_URLs,
        #list of strings
        GF_List *locations,
        #list of Metrics
        GF_List *metrics,
        #list of GF_MPD_Period
        GF_List *periods

    GF_MPD *gf_mpd_new()
    void gf_mpd_del(GF_MPD *mpd)
    #frees a SegmentURL
    void gf_mpd_segment_url_free(void *_item);