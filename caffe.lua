project "CaffeMake"
	location "%{wks.location}/vendor/caffe"
	kind "Makefile"
	language "C++"
	cppdialect "C++11"

	prebuildcommands { "cd %{prj.location} && cp -f Makefile.config.Xavier Makefile.config" }
	buildcommands {
		"make -j$(nproc)",
	 }

	cleancommands {
		"make clean",
	 }
	--staticruntime "on"
	targetdir ("%{wks.location}/build/install-" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/build/objdir/" ..  outputdir .. "/%{prj.name}")
	files
	{
		"%{prj.location}/src/**.h",
		"%{prj.location}/include/**.h",
		"%{prj.location}/include/**.hpp",
		"%{prj.location}/src/**.hpp",
		"%{prj.location}/src/**.cpp",
		"%{prj.location}/src/**.c",
		"%{prj.location}/Makefile",
		
	}

