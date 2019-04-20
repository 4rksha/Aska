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
IncludeDir["Glad"] = "Aska/vendor/Glad/include"
IncludeDir["ImGui"] = "Aska/vendor/imgui"
IncludeDir["glm"] = "Aska/vendor/glm"


include "Aska/vendor/GLFW"
include "Aska/vendor/Glad"
include "Aska/vendor/imgui"

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
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"

		defines
		{
			"ASKA_PLATFORM_WINDOWS",
			"ASKA_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
		
		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "ASKA_DEBUG"
		buildoptions "/MDd"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "ASKA_RELEASE"
		buildoptions "/MD"
		runtime "Release"
		symbols "On"

	filter "configurations:Dist"
		defines "ASKA_DIST"
		buildoptions "/MD"
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
		"%{IncludeDir.glm}"
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
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "ASKA_RELEASE"
		runtime "Release"
		buildoptions "/MD"
		symbols "On"

	filter "configurations:Dist"
		defines "ASKA_DIST"
		runtime "Release"
		buildoptions "/MD"
		symbols "On"
