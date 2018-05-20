#ifndef TIMEGM_H
	#define TIMEGM_H
	#ifdef _WIN32
		#ifndef timegm
			#define timegm _mkgmtime
		#endif
	#endif
#endif
