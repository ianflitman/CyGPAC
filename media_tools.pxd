include "isomedia.pxd"

cdef extern from "/home/ian/projects/tools/gpac/include/gpac/media_tools.h":
    GF_Err gf_media_mpd_start(char *mpd_name, char *title, bint use_url_template, bint single_segment, char *dash_ctx, GF_ISOFile *init_segment, double period_duration);
    GF_Err gf_media_mpd_end(char *mpd_name)
    #save file as fragmented movie dash_mode: 0 = DASH not used, 1 = DASH used without GOP spliting, 2 = DASH used with GOP spliting
    GF_Err gf_media_fragment_file(GF_ISOFile *input, const char *output_file_radical, const char *mpd_name, double max_duration_sec, u32 dash_mode, double dash_duration_sec, char *seg_rad_name, char *seg_ext, s32 subsegs_per_sidx, bint daisy_chain_sidx, bint use_url_template, bint use_single_segment, const char *dash_ctx, GF_ISOFile *sample_descs, u32 rep_id)

