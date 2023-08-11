{asm}

orig $334       ; SYS 820

;===============================================================================
;
; IRQ = InterruptReQuest
; SEI = Setzte I-Flag Statusregister verhindert IRQ
; CLI = Lösche I-Flag Statusregister lässt IRQ zu
; BMI = Verzweige bei gesetztem Negative-Flag
; BNE = Verzweige bei gelöschtem Zero-Flag
; CMP = Vergleiche mit Akkumulator
;
  Rasterzeile      = $d012
  RasterHiBit      = $d011
  Hintergrund      = $d021
  RasterStartOben  = 74
  RasterStartUnten = 202
  IRQFlag          = $d019 ; Bit 0: Anforderung durch Rasterstrahl (Reg. $D012)
  IRQMask          = $d01a ; Bit 0: IRQ wird durch Rasterstrahl ausgelöst.
  IRQNeu           = $314  ; IRQ Vektor NEU
  IRQAlt           = $315  ; IRQ Vektor ALT
  IRQKern          = $ea31 ; IRQ KERN
  CIATime          = $dc0d ; CIA TIME
;
;===============================================================================


;=======================================
; Start
;=======================================
	sei
;=======================================
; Lade Raster 74
;=======================================
	lda #74
	sta Rasterzeile
;=======================================
; Lösche Raster HighBit 
;=======================================
	lda RasterHiBit
	and #$7f
	sta RasterHiBit
;=======================================
; Rasterzeilen-Interrupt einschalten
;=======================================
	lda IRQMask
	ora #$01
	sta IRQMask
;=======================================
; IRQ auf neu stellen
; Und zurück 
; auf IRQ
;=======================================
	lda #<irq
	sta IRQNeu
	lda #>irq
	sta IRQAlt
;=======================================
; Zurück in basic
;=======================================
	cli
	rts


	irq:
		;=======================================
		; Unterprogramm IRQNEU
		;=======================================
			lda IRQFlag
			bmi vic_irq
			lda CIATime
			cli
			jmp IRQKern

	vic_irq:
		;=======================================
		;VIC-Interrupt bestätigen
		;=======================================
			sta IRQFlag
		;=======================================
		; Bei Raster 74 weiter im Programm
		;=======================================
			lda Rasterzeile
			cmp #74
			bne blau
		;=======================================
		; Hintergrud schwarz
		;=======================================
			lda 1020
			sta Hintergrund
		;=======================================
		; Schreibe Raster 202
		;=======================================
			lda #202
			sta Rasterzeile
			bne ende

	blau:
		;=======================================
		; Hintergrud blau
		;=======================================
			lda 1021
			sta Hintergrund
		;=======================================
		; Schreibe Raster 74
		;=======================================
			lda #74
			sta Rasterzeile

	ende:
		pla         ; Hole Akkumulatorwert vom Stack
		tay         ; Kopiere Akkumulator zu Y
		pla         ; Hole Akkumulatorwert vom Stack
		tax         ; Kopiere Akkumulator zu Y
		pla         ; Hole Akkumulatorwert vom Stack
		rti         ; Rückkehr aus Interrupt

{endasm}