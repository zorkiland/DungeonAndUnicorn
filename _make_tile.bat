@echo off

cd PETSCII
cd bin

REM CAHRPAD KOMPLETT EXPORT NAME RICHTIG STELLEN
copy "map0 - Tiles.bin" tile.bin /Y
copy "map0 - TileAttribs.bin" tilecolor.bin /Y

REM MAKE SOME PRG
copy /b c800.bin + tile.bin tile.prg
copy /b ca00.bin + tilecolor.bin tilecolor.prg
cd..
cd..

REM COPY PETSCII\bin\*.prg-> ROOT
xcopy PETSCII\bin\tile.prg *.* /Y
xcopy PETSCII\bin\tilecolor.prg *.* /Y

REM MAKE BACKUP MAKETILE
copy _make_tile.bas maketile.bas

REM C64List
c64list maketile.bas -prg -ovr -rem -crunch -supervariables -labels


REM SCHREIBE DISK
c1541 -format "maketile,id" d64 maketile.d64
c1541 -attach maketile.d64 -write maketile.prg maketile
c1541 -attach maketile.d64 -write tile.prg tile
c1541 -attach maketile.d64 -write tilecolor.prg tilecolor


REM x64 -warp maketile.d64
rem C64Debugger.exe -clearsettings
C64Debugger.exe -wait 3000 -layout 1 -d64 maketile.d64 -prg maketile.prg -autojmp


REM LESE DISK
c1541 maketile.d64 -dir
c1541 maketile.d64 -read datatile,s datatile.txt


REM AUSTAUSCH ->! ->[ ->]
cscript //nologo _make_tile.vbs "parameter1"

REM EOL VON CR -> LF
mac2unix main_tile.bas

REM CLEAR TEMPDATA
del maketile.bas
del maketile.prg
del tile.prg
del tilecolor.prg
del maketile.d64
del datatile.txt