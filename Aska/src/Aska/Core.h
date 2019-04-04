#pragma once

#ifdef ASKA_PLATFORM_WINDOWS
	#ifdef ASKA_BUILD_DLL
		#define ASKA_API __declspec(dllexport)			
	#else
		#define ASKA_API __declspec(dllimport)
	#endif
#else
	#error Aska only support Windows!
#endif 