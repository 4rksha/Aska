#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/fmt/ostr.h"

namespace Aska {

	class ASKA_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
	
}

// Core log macros
#define ASKA_CORE_ERROR(...)	::Aska::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ASKA_CORE_WARN(...)		::Aska::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ASKA_CORE_INFO(...)		::Aska::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ASKA_CORE_TRACE(...)	::Aska::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ASKA_CORE_FATAL(...)	::Aska::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define ASKA_ERROR(...)	::Aska::Log::GetClientLogger()->error(__VA_ARGS__)
#define ASKA_WARN(...)	::Aska::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ASKA_INFO(...)	::Aska::Log::GetClientLogger()->info(__VA_ARGS__)
#define ASKA_TRACE(...)	::Aska::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ASKA_FATAL(...)	::Aska::Log::GetClientLogger()->fatal(__VA_ARGS__)

