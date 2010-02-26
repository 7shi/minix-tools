del /ah minix-tools.suo
del minix-tools.ncb
del aout-tool\aout-tool.vcproj.*.user
del pe2aout\pe2aout.vcproj.*.user
del include\include.vcproj.*.user
del lib\c\lib_c.vcproj.*.user
del lib\sys\lib_sys.vcproj.*.user
del lib\curses\lib_curses.vcproj.*.user
del lib\editline\lib_editline.vcproj.*.user
del lib\timers\lib_timers.vcproj.*.user
del lib\util\lib_util.vcproj.*.user
del servers\mfs\srv_mfs.vcproj.*.user
del servers\ds\srv_ds.vcproj.*.user
del servers\hgfs\srv_hgfs.vcproj.*.user
del servers\inet\srv_inet.vcproj.*.user
del drivers\dec21140A\drv_dec21140A.vcproj.*.user
del commands\msh\cmd_msh.vcproj.*.user
del commands\sh\cmd_sh.vcproj.*.user
del commands\make\cmd_make.vcproj.*.user
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
rd /s /q "lib\c\MINIX Release"
rd /s /q "lib\sys\MINIX Release"
rd /s /q "lib\curses\MINIX Release"
rd /s /q "lib\editline\MINIX Release"
rd /s /q "lib\timers\MINIX Release"
rd /s /q "lib\util\MINIX Release"
rd /s /q "servers\mfs\MINIX Release"
rd /s /q "servers\ds\MINIX Release"
rd /s /q "servers\hgfs\MINIX Release"
rd /s /q "servers\inet\MINIX Release"
rd /s /q "drivers\dec21140A\MINIX Release"
rd /s /q "commands\msh\MINIX Release"
rd /s /q "commands\sh\MINIX Release"
rd /s /q "commands\make\MINIX Release"
rd /s /q "aout-tool\MINIX Release"
rd /s /q "test\MINIX Release"
pause
