cdef GF_4CC(char a, char b, char c, char d):
    return ((a<<24)|(b<<16)|(c<<8)|(d))

cdef enum:
    GF_ISOM_BOX_TYPE_CO64	= GF_4CC( 'c', 'o', '6', '4' ),
    GF_ISOM_BOX_TYPE_STCO	= GF_4CC( 's', 't', 'c', 'o' ),
    GF_ISOM_BOX_TYPE_CRHD	= GF_4CC( 'c', 'r', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_CTTS	= GF_4CC( 'c', 't', 't', 's' ),
    GF_ISOM_BOX_TYPE_CPRT	= GF_4CC( 'c', 'p', 'r', 't' ),
    GF_ISOM_BOX_TYPE_CHPL	= GF_4CC( 'c', 'h', 'p', 'l' ),
    GF_ISOM_BOX_TYPE_URL	= GF_4CC( 'u', 'r', 'l', ' ' ),
    GF_ISOM_BOX_TYPE_URN	= GF_4CC( 'u', 'r', 'n', ' ' ),
    GF_ISOM_BOX_TYPE_DINF	= GF_4CC( 'd', 'i', 'n', 'f' ),
    GF_ISOM_BOX_TYPE_DREF	= GF_4CC( 'd', 'r', 'e', 'f' ),
    GF_ISOM_BOX_TYPE_STDP	= GF_4CC( 's', 't', 'd', 'p' ),
    GF_ISOM_BOX_TYPE_EDTS	= GF_4CC( 'e', 'd', 't', 's' ),
    GF_ISOM_BOX_TYPE_ELST	= GF_4CC( 'e', 'l', 's', 't' ),
    GF_ISOM_BOX_TYPE_UUID	= GF_4CC( 'u', 'u', 'i', 'd' ),
    GF_ISOM_BOX_TYPE_FREE	= GF_4CC( 'f', 'r', 'e', 'e' ),
    GF_ISOM_BOX_TYPE_HDLR	= GF_4CC( 'h', 'd', 'l', 'r' ),
    GF_ISOM_BOX_TYPE_GMHD	= GF_4CC( 'g', 'm', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_HMHD	= GF_4CC( 'h', 'm', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_HINT	= GF_4CC( 'h', 'i', 'n', 't' ),
    GF_ISOM_BOX_TYPE_MDIA	= GF_4CC( 'm', 'd', 'i', 'a' ),
    GF_ISOM_BOX_TYPE_MDAT	= GF_4CC( 'm', 'd', 'a', 't' ),
    GF_ISOM_BOX_TYPE_MDHD	= GF_4CC( 'm', 'd', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_MINF	= GF_4CC( 'm', 'i', 'n', 'f' ),
    GF_ISOM_BOX_TYPE_MOOV	= GF_4CC( 'm', 'o', 'o', 'v' ),
    GF_ISOM_BOX_TYPE_MVHD	= GF_4CC( 'm', 'v', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_STSD	= GF_4CC( 's', 't', 's', 'd' ),
    GF_ISOM_BOX_TYPE_STSZ	= GF_4CC( 's', 't', 's', 'z' ),
    GF_ISOM_BOX_TYPE_STZ2	= GF_4CC( 's', 't', 'z', '2' ),
    GF_ISOM_BOX_TYPE_STBL	= GF_4CC( 's', 't', 'b', 'l' ),
    GF_ISOM_BOX_TYPE_STSC	= GF_4CC( 's', 't', 's', 'c' ),
    GF_ISOM_BOX_TYPE_STSH	= GF_4CC( 's', 't', 's', 'h' ),
    GF_ISOM_BOX_TYPE_SKIP	= GF_4CC( 's', 'k', 'i', 'p' ),
    GF_ISOM_BOX_TYPE_SMHD	= GF_4CC( 's', 'm', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_STSS	= GF_4CC( 's', 't', 's', 's' ),
    GF_ISOM_BOX_TYPE_STTS	= GF_4CC( 's', 't', 't', 's' ),
    GF_ISOM_BOX_TYPE_TRAK	= GF_4CC( 't', 'r', 'a', 'k' ),
    GF_ISOM_BOX_TYPE_TKHD	= GF_4CC( 't', 'k', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_TREF	= GF_4CC( 't', 'r', 'e', 'f' ),
    GF_ISOM_BOX_TYPE_UDTA	= GF_4CC( 'u', 'd', 't', 'a' ),
    GF_ISOM_BOX_TYPE_VMHD	= GF_4CC( 'v', 'm', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_FTYP	= GF_4CC( 'f', 't', 'y', 'p' ),
    GF_ISOM_BOX_TYPE_FADB	= GF_4CC( 'p', 'a', 'd', 'b' ),
    GF_ISOM_BOX_TYPE_PDIN	= GF_4CC( 'p', 'd', 'i', 'n' ),
    GF_ISOM_BOX_TYPE_SDTP	= GF_4CC( 's', 'd', 't', 'p' ),
    GF_ISOM_BOX_TYPE_SBGP	= GF_4CC( 's', 'b', 'g', 'p' ),
    GF_ISOM_BOX_TYPE_SGPD	= GF_4CC( 's', 'g', 'p', 'd' ),
    #Movie Fragments
    GF_ISOM_BOX_TYPE_MVEX	= GF_4CC( 'm', 'v', 'e', 'x' ),
    GF_ISOM_BOX_TYPE_MEHD	= GF_4CC( 'm', 'e', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_TREX	= GF_4CC( 't', 'r', 'e', 'x' ),
    GF_ISOM_BOX_TYPE_MOOF	= GF_4CC( 'm', 'o', 'o', 'f' ),
    GF_ISOM_BOX_TYPE_MFHD	= GF_4CC( 'm', 'f', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_TRAF	= GF_4CC( 't', 'r', 'a', 'f' ),
    GF_ISOM_BOX_TYPE_TFHD	= GF_4CC( 't', 'f', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_TRUN	= GF_4CC( 't', 'r', 'u', 'n' ),
    #MP4 extensions
    GF_ISOM_BOX_TYPE_DPND	= GF_4CC( 'd', 'p', 'n', 'd' ),
    GF_ISOM_BOX_TYPE_IODS	= GF_4CC( 'i', 'o', 'd', 's' ),
    GF_ISOM_BOX_TYPE_ESDS	= GF_4CC( 'e', 's', 'd', 's' ),
    GF_ISOM_BOX_TYPE_MPOD	= GF_4CC( 'm', 'p', 'o', 'd' ),
    GF_ISOM_BOX_TYPE_SYNC	= GF_4CC( 's', 'y', 'n', 'c' ),
    GF_ISOM_BOX_TYPE_IPIR	= GF_4CC( 'i', 'p', 'i', 'r' ),
    GF_ISOM_BOX_TYPE_SDHD	= GF_4CC( 's', 'd', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_ODHD	= GF_4CC( 'o', 'd', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_NMHD	= GF_4CC( 'n', 'm', 'h', 'd' ),
    GF_ISOM_BOX_TYPE_MP4S	= GF_4CC( 'm', 'p', '4', 's' ),
    GF_ISOM_BOX_TYPE_MP4A	= GF_4CC( 'm', 'p', '4', 'a' ),
    GF_ISOM_BOX_TYPE_MP4V	= GF_4CC( 'm', 'p', '4', 'v' ),
    #AVC / H264 extension
    GF_ISOM_BOX_TYPE_AVCC	= GF_4CC( 'a', 'v', 'c', 'C' ),
    GF_ISOM_BOX_TYPE_BTRT	= GF_4CC( 'b', 't', 'r', 't' ),
    GF_ISOM_BOX_TYPE_M4DS	= GF_4CC( 'm', '4', 'd', 's' ),
    GF_ISOM_BOX_TYPE_PASP	= GF_4CC( 'p', 'a', 's', 'p' ),
    GF_ISOM_BOX_TYPE_AVC1	= GF_4CC( 'a', 'v', 'c', '1' ),
    GF_ISOM_BOX_TYPE_AVC2	= GF_4CC( 'a', 'v', 'c', '2' ),
    GF_ISOM_BOX_TYPE_SVCC	= GF_4CC( 's', 'v', 'c', 'C' ),
    GF_ISOM_BOX_TYPE_SVC1	= GF_4CC( 's', 'v', 'c', '1' ),

    GF_ISOM_MEDIA_VISUAL	= GF_4CC( 'v', 'i', 'd', 'e' ),
    GF_ISOM_MEDIA_AUDIO		= GF_4CC( 's', 'o', 'u', 'n' ),
    GF_ISOM_MEDIA_HINT		= GF_4CC( 'h', 'i', 'n', 't' ),
    GF_ISOM_MEDIA_META		= GF_4CC( 'm', 'e', 't', 'a' ),
    GF_ISOM_MEDIA_TEXT		= GF_4CC( 't', 'e', 'x', 't' ),
    #subtitle code point used on ipod - same as text
    GF_ISOM_MEDIA_SUBT		= GF_4CC( 's', 'b', 't', 'l' ),
    GF_ISOM_MEDIA_SUBPIC	= GF_4CC( 's', 'u', 'b', 'p' ),
    #MPEG-4 media types
    GF_ISOM_MEDIA_OD		= GF_4CC( 'o', 'd', 's', 'm' ),
    GF_ISOM_MEDIA_OCR		= GF_4CC( 'c', 'r', 's', 'm' ),
    GF_ISOM_MEDIA_SCENE		= GF_4CC( 's', 'd', 's', 'm' ),
    GF_ISOM_MEDIA_MPEG7		= GF_4CC( 'm', '7', 's', 'm' ),
    GF_ISOM_MEDIA_OCI		= GF_4CC( 'o', 'c', 's', 'm' ),
    GF_ISOM_MEDIA_IPMP		= GF_4CC( 'i', 'p', 's', 'm' ),
    GF_ISOM_MEDIA_MPEGJ		= GF_4CC( 'm', 'j', 's', 'm' ),
    #GPAC-defined, for any track using MPEG-4 systems signaling but with undefined streaml types
    GF_ISOM_MEDIA_ESM		= GF_4CC( 'g', 'e', 's', 'm' ),
    #DIMS media type (same as scene but with a different mediaInfo)
    GF_ISOM_MEDIA_DIMS		= GF_4CC( 'd', 'i', 'm', 's' ),
    GF_ISOM_MEDIA_FLASH		= GF_4CC( 'f', 'l', 's', 'h' ),
    #reserved, internal use in the lib. Indicates the track complies to MPEG-4 system
    #specification, and the usual OD framework tools may be used
    GF_ISOM_SUBTYPE_MPEG4		= GF_4CC( 'M', 'P', 'E', 'G' ),

    #reserved, internal use in the lib. Indicates the track is of GF_ISOM_SUBTYPE_MPEG4
    #but it is encrypted.
    GF_ISOM_SUBTYPE_MPEG4_CRYP	= GF_4CC( 'E', 'N', 'C', 'M' ),

    #AVC/H264 media type - not listed as an MPEG-4 type, ALTHOUGH this library automatically remaps
    #GF_AVCConfig to MPEG-4 ESD
    GF_ISOM_SUBTYPE_AVC_H264	= GF_4CC( 'a', 'v', 'c', '1' ),
    GF_ISOM_SUBTYPE_AVC2_H264	= GF_4CC( 'a', 'v', 'c', '2' ),
    GF_ISOM_SUBTYPE_SVC_H264	= GF_4CC( 's', 'v', 'c', '1' ),

    #3GPP(2) extension subtypes
    GF_ISOM_SUBTYPE_3GP_H263	= GF_4CC( 's', '2', '6', '3' ),
    GF_ISOM_SUBTYPE_3GP_AMR		= GF_4CC( 's', 'a', 'm', 'r' ),
    GF_ISOM_SUBTYPE_3GP_AMR_WB	= GF_4CC( 's', 'a', 'w', 'b' ),
    GF_ISOM_SUBTYPE_3GP_EVRC	= GF_4CC( 's', 'e', 'v', 'c' ),
    GF_ISOM_SUBTYPE_3GP_QCELP	= GF_4CC( 's', 'q', 'c', 'p' ),
    GF_ISOM_SUBTYPE_3GP_SMV		= GF_4CC( 's', 's', 'm', 'v' ),

    #3GPP DIMS
    GF_ISOM_SUBTYPE_3GP_DIMS = GF_4CC( 'd', 'i', 'm', 's' ),
    GF_ISOM_SUBTYPE_AC3		 = GF_4CC( 'a', 'c', '-', '3' ),
    GF_ISOM_SUBTYPE_LSR1	 = GF_4CC( 'l', 's', 'r', '1' )