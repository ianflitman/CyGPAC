CyGPAC
====== 

A Limited Cython wrapper to GPAC

This is a Cython wrapper to GPAC (http://gpac.wp.mines-telecom.fr/) that focuses on manipulating the MP4 box structure
to allow the streaming of non-linear video fragments over DASH for Chrome.

The eventual aim is to facilitate a user-editable stream of video from a choice of material represented by video segments.
So if the stream as an initial narrative comprising of segments A,B and C from a set of A,B,C,D, and E, the user can
change B to E, so that the result A,E,C stream is concatenated and streamed seamlessly. 

This means the video stream as represented by MPD file and the timestamps and so on for each segment need to change.
