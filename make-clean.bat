del /ah minix-tools.suo
del minix-tools.ncb
del aout-tool\aout-tool.vcproj.*.user
del pe2aout\pe2aout.vcproj.*.user
del libc\libc.vcproj.*.user
del test\test.vcproj.*.user

rd /s /q Debug
rd /s /q Release
rd /s /q aout-tool\Debug
rd /s /q aout-tool\Release
rd /s /q pe2aout\Debug
rd /s /q pe2aout\Release

rd /s /q "MINIX Release"
rd /s /q "libc\MINIX Release"
rd /s /q "test\MINIX Release"
pause