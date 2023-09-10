project "EnTT"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/%{cfg.buildcfg}")
    objdir ("bin/intermediate/%{cfg.buildcfg}")

    files
    {
        "%{prj.location}/src/entt/**.h",
        "%{prj.location}/src/entt/**.hpp",
        "%{prj.location}/src/entt/**.cpp"
    }

    includedirs
    {
        "%{prj.location}/src",
        "%{prj.location}/src/entt"
    }

    if os.host() == "windows" then
        defines
        {
            "_CRT_SECURE_NO_WARNINGS",
        }
    end

    filter "configurations:Debug"
        defines "DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "NDEBUG"
        runtime "Release"
        optimize "On"