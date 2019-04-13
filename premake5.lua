workspace "Aska"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Aska/vendor/GLFW/include"

include "Aska/vendor/GLFW"

project "Aska"
	location "Aska"
	kind "SharedLib"
	language "C++"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "askapch.h"
	pchsource "Aska/src/askapch.cpp"

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"

		defines
		{
			"ASKA_PLATFORM_WINDOWS",
			"ASKA_BUILD_DLL"
		}
		
		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "ASKA_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "ASKA_RELEASE"
		runtime "Release"
		symbols "On"

	filter "configurations:Dist"
		defines "ASKA_DIST"
		runtime "Release"
		symbols "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"Aska/vendor/spdlog/include",
		"Aska/src",
		"Aska/vendor"
	}

	links {
		"Aska"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ASKA_PLATFORM_WINDOWS"
		}
		

	filter "configurations:Debug"
		defines "ASKA_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "ASKA_RELEASE"
		runtime "Release"
		symbols "On"

	filter "configurations:Dist"
		defines "ASKA_DIST"
		runtime "Release"
		symbols "On"
