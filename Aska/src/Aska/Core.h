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

#ifdef ASKA_DEBUG
	#define ASKA_ENABLE_ASSERTS
#endif

#ifdef ASKA_ENABLE_ASSERTS
	#define ASKA_ASSERT(x, ...) {if (!(x)) {ASKA_ERROR("Assertion Failed : {0}", __VA_ARGS__); __debugbreak(); } }
	#define ASKA_CORE_ASSERT(x, ...) {if (!(x)) {ASKA_CORE_ERROR("Assertion Failed : {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define ASKA_ASSERT(x, ...)
	#define ASKA_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define ASKA_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)