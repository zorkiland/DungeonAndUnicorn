@echo off

cd PETSCII
cd bin

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


REM COPY PRG->VICE\bin
xcopy maketile.prg VICE\bin\*.* /Y
xcopy tile.prg VICE\bin\*.* /Y
xcopy tilecolor.prg VICE\bin\*.* /Y


REM SCHREIBE DISK
cd VICE
cd bin
c1541 -format "maketile,id" d64 maketile.d64
c1541 -attach maketile.d64 -write maketile.prg maketile
c1541 -attach maketile.d64 -write tile.prg tile
c1541 -attach maketile.d64 -write tilecolor.prg tilecolor

cd..
cd..

REM COPY VICE\bin\maketile.D64-> ROOT
xcopy VICE\bin\maketile.d64 *.* /Y

rem C64Debugger.exe -clearsettings
C64Debugger.exe -wait 3000 -layout 1 -d64 maketile.d64 -prg maketile.prg -autojmp

REM COPY PRG->VICE\bin
xcopy maketile.d64 VICE\bin\*.* /Y
cd VICE
cd bin

REM LESE DISK
c1541 maketile.d64 -dir
c1541 maketile.d64 -read datatile,s datatile.txt
cd..
cd..

REM COPY VICE\bin\maketile.D64-> ROOT
xcopy VICE\bin\datatile.txt *.* /Y

REM AUSTAUSCH ->! ->[ ->]
cscript //nologo _make_tile.vbs "parameter1"

REM CLEAR TEMPDATA
del maketile.bas
del maketile.prg
del tile.prg
del tilecolor.prg
del maketile.d64
del datatile.txt