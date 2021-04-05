project "CaffeMake"
	location "%{wks.location}/vendor/caffe"
	kind "Makefile"
	language "C++"
	cppdialect "C++11"

	prebuildcommands { "cd %{prj.location} && cp -f Makefile.config.Xavier Makefile.config" }
	buildcommands {
		"make -f caffe.mk -j6",
	 }
	postbuildcommands{"cd %{prj.location} && cp -r build/src/caffe/proto include/caffe"}

	cleancommands {
		"make -f caffe.mk clean",
	 }
	--staticruntime "on"
	targetdir ("%{wks.location}/build/install" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/build/objdir/" ..  outputdir .. "/%{prj.name}")
	files
	{
		"%{prj.location}/src/**.h",
		"%{prj.location}/include/**.h",
		"%{prj.location}/include/**.hpp",
		"%{prj.location}/src/**.hpp",
		"%{prj.location}/src/**.cpp",
		"%{prj.location}/src/**.c",
		
	}

