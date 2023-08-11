@echo off

cd PETSCII
cd bin

copy /b e000.bin + charset.bin charset.prg
copy /b c400.bin + map0.bin map0.prg
copy /b c400.bin + map1.bin map1.prg
copy /b e800.bin + sprite.bin sprite.prg
cd..
cd..

REM COPY PETSCII\bin\*.prg-> ROOT
xcopy PETSCII\bin\charset.prg *.* /Y
xcopy PETSCII\bin\map0.prg *.* /Y
xcopy PETSCII\bin\map1.prg *.* /Y
xcopy PETSCII\bin\sprite.prg *.* /Y


REM C64List BAS->PRG
c64list main.bas -prg -ovr -rem -crunch -supervariables -labels
c64list asm.raster.asm -prg -ovr


REM BLITZ
blitz main.prg -o blitz.prg
REM reblitz64.js main.prg blitz.prg i,j

REM EXOMIZER
exomizer sfx basic blitz.prg -o game.prg -n

REM BACK BASIC
REM c64list main.prg -txt -ovr

REM COPY PRG->VICE\bin
xcopy main.prg VICE\bin\*.* /Y
xcopy blitz.prg VICE\bin\*.* /Y
xcopy game.prg VICE\bin\*.* /Y
xcopy asm.raster.prg VICE\bin\*.* /Y
xcopy asm.tile.prg VICE\bin\*.* /Y
xcopy txt.intro.seq VICE\bin\*.* /Y
xcopy txt.ende.seq VICE\bin\*.* /Y
xcopy txt.welcome.lena.seq VICE\bin\*.* /Y
xcopy txt.welcome.dolm.seq VICE\bin\*.* /Y
xcopy txt.welcome.mira.seq VICE\bin\*.* /Y
xcopy txt.fight.seq VICE\bin\*.* /Y
xcopy charset.prg VICE\bin\*.* /Y
xcopy map0.prg VICE\bin\*.* /Y
xcopy map1.prg VICE\bin\*.* /Y
xcopy sprite.prg VICE\bin\*.* /Y



REM SCHREIBE DISK
cd VICE
cd bin
c1541 -format "unicorn,id" d64 unicorn.d64
rem c1541 -attach unicorn.d64 -write main.prg main
c1541 -attach unicorn.d64 -write game.prg game
c1541 -attach unicorn.d64 -write charset.prg charset
c1541 -attach unicorn.d64 -write map0.prg map0
c1541 -attach unicorn.d64 -write map1.prg map1
c1541 -attach unicorn.d64 -write sprite.prg sprite
c1541 -attach unicorn.d64 -write asm.raster.prg asm.raster
c1541 -attach unicorn.d64 -write asm.tile.prg asm.tile
c1541 -attach unicorn.d64 -write txt.intro.seq txt.intro,s
c1541 -attach unicorn.d64 -write txt.ende.seq txt.ende,s
c1541 -attach unicorn.d64 -write txt.fight.seq txt.fight,s
c1541 -attach unicorn.d64 -write txt.welcome.lena.seq txt.welcome.lena,s
c1541 -attach unicorn.d64 -write txt.welcome.dolm.seq txt.welcome.dolm,s
c1541 -attach unicorn.d64 -write txt.welcome.mira.seq txt.welcome.mira,s

cd..
cd..

REM COPY VICE\bin\dungen.D64-> ROOT
xcopy VICE\bin\unicorn.d64 *.* /Y

rem C64Debugger.exe -clearsettings
C64Debugger.exe -wait 3000 -layout 1 -d64 unicorn.d64 -prg blitz.prg -autojmp

