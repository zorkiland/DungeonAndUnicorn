@echo off

cd PETSCII
cd bin

REM CAHRPAD KOMPLETT EXPORT NAME RICHTIG STELLEN
copy "map0 - Chars.bin" charset.bin /Y
copy "map0 - Map (60x24).bin" map0.bin /Y
copy "map0 - Tiles.bin" tile.bin /Y
copy "map0 - TileAttribs.bin" tilecolor.bin /Y
copy "map1 - Map (60x24).bin" map1.bin /Y

REM MAKE SOME PRG
copy /b e000.bin + charset.bin charset.prg
copy /b c400.bin + map0.bin map0.prg
copy /b c400.bin + map1.bin map1.prg
copy /b e800.bin + sprite.bin sprite.prg
copy /b c800.bin + tile.bin tile.prg
copy /b ca00.bin + tilecolor.bin tilecolor.prg

cd..
cd..

REM COPY PETSCII\bin\*.prg-> ROOT
xcopy PETSCII\bin\charset.prg *.* /Y
xcopy PETSCII\bin\map0.prg *.* /Y
xcopy PETSCII\bin\map1.prg *.* /Y
xcopy PETSCII\bin\sprite.prg *.* /Y



REM MERGE TO MAIN
copy /b main_code.bas + main_tile.bas main.bas /y

REM C64List BAS->PRG
c64list main.bas -prg -ovr -rem -crunch -supervariables -labels
c64list asm.raster.asm -prg -ovr

REM BACK BASIC
c64list main.prg -txt -ovr


REM ***********************************************************************
REM
REM c1541 image.d64 -dir <oder list>
REM c1541 image.d64 -extract
REM
REM ***********************************************************************

REM c64list compactor.bas -prg -ovr
REM blitz compactor.prg -o bcompactor.prg
REM c1541 -format "compactor,id" d64 compactor.d64
REM c1541 -attach compactor.d64 -write bcompactor.prg bcompactor
REM c1541 -attach compactor.d64 -write compactor.prg compactor
REM c1541 -attach compactor.d64 -write main.prg main
REM x64 -warp compactor.d64
REM c1541 compactor.d64 -dir
REM c1541 compactor.d64 -read com com.prg

REM ***********************************************************************


REM BLITZ
blitz main.prg -o blitz.prg
REM blitz com.prg -o blitz.prg
REM node reblitz64.js main.prg blitz.prg i,j


REM EXOMIZER
exomizer sfx basic blitz.prg -o game.prg -n


REM SCHREIBE DISK
c1541 -format "unicorn,id" d64 unicorn.d64
c1541 -attach unicorn.d64 -write game.prg game
c1541 -attach unicorn.d64 -write charset.prg charset
c1541 -attach unicorn.d64 -write map0.prg map0
c1541 -attach unicorn.d64 -write map1.prg map1
c1541 -attach unicorn.d64 -write sprite.prg sprite
c1541 -attach unicorn.d64 -write asm.raster.prg asm.raster
c1541 -attach unicorn.d64 -write txt.intro.seq txt.intro,s
c1541 -attach unicorn.d64 -write txt.nibelheim.seq txt.nibelheim,s

REM CLEAN TEMPDATA
REM del com.prg
REM del compactor.prg
REM del bcompactor.prg
REM del compactor.d64

del main.prg
del blitz.prg
REM del game.prg
del asm.raster.prg
del charset.prg
del map0.prg
del map1.prg
del sprite.prg
del main.bas
REM del main.txt
del blitz.prg.xref

REM C64Debugger.exe -clearsettings
C64Debugger.exe -wait 3000 -layout 1 -d64 unicorn.d64 -prg game.prg -autojmp

REM C64Debugger.exe -wait 3000 -layout 1 -d64 unicorn.d64 -prg compactor.prg -autojmp
REM C64Debugger.exe -clearsettings -wait 3000 -layout 1 -d64 unicorn.d64 -prg game.prg -autojmp