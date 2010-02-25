del /ah minix-tools.suo
del minix-tools.ncb
del aout-tool\aout-tool.vcproj.*.user
del pe2aout\pe2aout.vcproj.*.user
del include\include.vcproj.*.user
del libc\libc.vcproj.*.user
del libsys\libsys.vcproj.*.user
del libcurses\libcurses.vcproj.*.user
del libeditline\libeditline.vcproj.*.user
del libtimers\libtimers.vcproj.*.user
del mfs\mfs.vcproj.*.user
del dec21140A\dec21140A.vcproj.*.user
del test\test.vcproj.*.user

rd /s /q Debug
rd /s /q Release
rd /s /q aout-tool\Debug
rd /s /q aout-tool\Release
rd /s /q pe2aout\Debug
rd /s /q pe2aout\Release
rd /s /q test\Debug
rd /s /q test\Release

rd /s /q "MINIX Release"
rd /s /q "include\MINIX Release"
rd /s /q "libc\MINIX Release"
rd /s /q "libsys\MINIX Release"
rd /s /q "libcurses\MINIX Release"
rd /s /q "libeditline\MINIX Release"
rd /s /q "libtimers\MINIX Release"
rd /s /q "mfs\MINIX Release"
rd /s /q "dec21140A\MINIX Release"
rd /s /q "test\MINIX Release"
pause
