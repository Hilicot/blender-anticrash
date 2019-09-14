@echo off
setlocal enabledelayedexpansion

Rem -+-+-+-+--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Rem -+-+-+	Set your variables here -+-+-+-+-+-+-+-+-+-+-+-+-
Rem -+-+-+-+--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

set blenderfolder="C:\Program Files\Blender Foundation\Blender" 
set blendfile="D:\video editing\Video in progress\test.blend"
set "namePrefix=name"
set "extension=.jpg"
set outputpath="D:\video editing\Video in progress\Render"

Rem -+-+-+-+--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Rem -+-+-+-+ Define your animation intervals (in this example: render from 2400 to 2550, then render from 2600 to 2750)
Rem -+-+-+-+ (each line is a separate interval, delete the second line if you need only one)
Rem -+-+-+-+--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

call :startBlender 2400 2550
call :startBlender 2600 2750




Rem -+-+-+-+--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Rem -+-+-+	CODE -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Rem -+-+-+-+--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

shutdown -h
goto End

:startBlender
cd  %blenderfolder%
:restart
blender --background %blendfile% --frame-start %1 --frame-end %2 -a

cd %outputpath%
if %2 LSS 10 (
	set "name=000%2"
) else (
	if %2 LSS 100 (
		set "name=00%2" 
	) else (
		if %2 LSS 1000 (
			set "name=0%2" 
		) else (
			set "name=%2"
		)
	)
)
set "filename=%namePrefix%%name%%extension%
echo %filename%
set "filepath=%outputpath%\%filename%"
echo %filepath%

if not exist "%filepath%" goto restart

goto :eof


:End
