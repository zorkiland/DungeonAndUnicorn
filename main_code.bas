'*****************************
'c64list v4.04
'*****************************

'$FFFF           """""""""""""""""""""""""""""""""
'                " ------------- " ||||||||||||| "
'                " ------------- " || KERNAL ||| "
'$E800 = SPRITES " ------------- " ||||||||||||| "
'$E000 = CHAR    """""""""""""""""""""""""""""""""""""""""""""""""
'                "               "               " +++++++++++++ "
'                "               "     CHAR      " ++++ I/O ++++ "
'                "               "               " +++++++++++++ "
'$D000 = VIC     """""""""""""""""""""""""""""""""""""""""""""""""
'                " +++++++++++++ "
'$C800 = FREE    " +++++++++++++ "
'$C400 = MAP     " +++++++++++++ "
'$C000 = SCREEN  """""""""""""""""""""""""""""""""
'                " ------------- " ||||||||||||| "
'                " ------------- " || BASIC- ||| "
'                " ------------- " ||  ROM   ||| "
'                " ------------- " ||||||||||||| "
'$A000           """""""""""""""""""""""""""""""""
'                " +++++++++++++ "
'                " +++++++++++++ "
'$0800 = BASIC   " +++++++++++++ "
'$0400 = FREE    " +++++++++++++ "
'$0000 = ZERO    """""""""""""""""

'<|||> = wird z.B. bei PEEK gelesen
'<---> = wird z.B. bei POKE geschrieben
'<+++> = lesend + schreibend
'<   > = von BASIC aus nicht erreichbar

{renumber}

'supervar_tile
	{var:map_tile=t$}
'supervar_item
	{var:item_name=i$}
	{var:item_atk=ia%}
	{var:item_def=id%}
	{var:item_level=il%}
	{var:item_speed=is%}
	{var:item_mana=ie%}
	{var:item_ident=it%}
	{var:inventar_slot=in%}
	{var:inventar_max=ix%}
	{var:nimm_item=ni%}
	{var:inventar_slottemp=tt%}	
'supervar_player
	{var:player_name=p$}
	{var:player_hp=ph%}
	{var:player_mp=pm%}
	{var:player_atk=pa%}
	{var:player_def=pd%}
	{var:player_level=pl%}
	{var:player_hp_max=p1%}
	{var:player_mp_max=p2%}
	{var:player_activ=p3%}
	{var:player_tile=pd$}
	{var:player_waffe=pw%}
	{var:player_ruestung=pr%}
	{var:player_relikt=pe%}
	{var:player_exp=px%}
	{var:player_speed=pb%}
'supervar_monster
	{var:monster_name=m$}
	{var:monster_hp=mh%}
	{var:monster_mp=mm%}
	{var:monster_atk=ma%}
	{var:monster_def=md%}
	{var:monster_level=ml%}
	{var:monster_tile=md$}
	{var:monster_exp=mx%}
	{var:monster_speed=mb%}
'supervar_speicher
	{var:bildschirmspeicher=qs}
	{var:multifarbspeicher_1=qo}
	{var:multifarbspeicher_2=qp}
	{var:bildschirmfarbe=qq}
	{var:rahmenfarbe=qr}
	{var:start_map=sm}
	{var:video_interface_chip=v}
'superva_sprite
	{var:sprite0_x=h0}
	{var:sprite0_y=h1}
	{var:sprite1_x=h2}
	{var:sprite1_y=h3}
	{var:sprite2_x=h4}
	{var:sprite2_y=h5}
	{var:sprite3_x=h6}
	{var:sprite3_y=h7}
	{var:sprite4_x=h8}
	{var:sprite4_y=h9}
	{var:sprite5_x=i0}
	{var:sprite5_y=i1}
	{var:sprite6_x=i2}
	{var:sprite6_y=i3}
	{var:sprite7_x=i4}
	{var:sprite7_y=i5}
	{var:sprite_on_off=i6}
	{var:sprite_multi_on_off=i7}
	{var:sprite_multicolor_1=i8}
	{var:sprite_multicolor_2=i9}
	{var:sprite_hirescolor=j0}
	{var:sprite_register=j1}
	{var:sprite_x_highbit=j2}
	{var:spritebank=j3}
'supervar_color
	{var:farbe_sw=q1%}
	{var:farbe_ws=q2%}
	{var:farbe_rd=q3%}
	{var:farbe_tk=q4%}
	{var:farbe_vi=q5%}
	{var:farbe_gn=q6%}
	{var:farbe_bl=q7%}
	{var:farbe_ge=q8%}
	{var:farbe_or=q9%}
	{var:farbe_br=qa%}
	{var:farbe_lrd=qb%}
	{var:farbe_dgr=cb%}
	{var:farbe_mgr=qc%}
	{var:farbe_lgn=qd%}
	{var:farbe_lbl=qe%}
	{var:farbe_lgr=qf%}
'supervar_multicolor
	{var:farbe_multi_sw=qg%}
	{var:farbe_multi_ws=qh%}
	{var:farbe_multi_br=qi%}
	{var:farbe_multi_tk=qj%}
	{var:farbe_multi_vi=qk%}
	{var:farbe_multi_gn=ql%}
	{var:farbe_multi_bl=qm%}
	{var:farbe_multi_ge=qn%}
'supervar_fight
	{var:fight_hp=fh%}
	{var:fight_active=ft%}
	{var:fight_rnd_level=fc%}
	{var:fight_mp=fm%}
	{var:fight_level=fl%}
	{var:fight_posx=fx%}
	{var:fight_posy=fy%}
	{var:fight_atk=fa%}
	{var:fight_def=fd%}
	{var:fight_hp_max=f1%}
	{var:fight_mp_max=f2%}
	{var:fight_speed=f3%}
	{var:fight_basis_speed=f4%}
'supervar_seq
	{var:seq_select=aa$}
	{var:seq_buffer=b$}
'supervar_other
	{var:val_atk=t1%}
	{var:val_def=t2%}
'supervar_schalter
	{var:schalter_raum=s0%}
	{var:schalter_posx=s1%}
	{var:schalter_posy=s2%}
	{var:schalter_flag=s3%}
'supervar_aktor
	{var:aktor_raum=a0%}
	{var:aktor_posx=a1%}
	{var:aktor_posy=a2%}
'supervar_npc
	{var:npc_raum=n0%}
	{var:npc_posx=pa}
	{var:npc_posy=ma}
	{var:npc_flag=n3%}
'supervar_event
	{var:event_raum=er%}
	{var:event_posx=ex%}
	{var:event_posy=ey%}
	{var:event_item=et%}
'
if peek(2)=0  then poke 2,99 : load"asm.raster",8,1
if peek(2)=99 then poke 2,98 : load"charset",8,1
if peek(2)=98 then poke 2,97 : load"sprite",8,1
if peek(2)=97 then poke 2,96 : load"map0",8,1
'
'dim
	'monster
		dim {var:monster_name}(13),{var:monster_tile}(13),{var:monster_hp}(13),{var:monster_mp}(13),{var:monster_atk}(13),{var:monster_def}(13),{var:monster_level}(13),{var:monster_speed}(13),{var:monster_exp}(13)
	'player
		dim {var:player_name}(3),{var:player_hp}(3),{var:player_mp}(3),{var:player_level}(3),{var:player_atk}(3),{var:player_def}(3),{var:player_speed}(3),{var:player_waffe}(3),{var:player_ruestung}(3)
	'fight
		dim {var:fight_hp}(11),{var:fight_active}(11),{var:fight_rnd_level}(11),{var:fight_speed}(11),{var:fight_basis_speed}(11),{var:fight_mp}(11),{var:fight_level}(11),{var:fight_posx}(11),{var:fight_posy}(11),{var:fight_atk}(11),{var:fight_def}(11),{var:fight_hp_max}(11),{var:fight_mp_max}(11)
		for i=0 to 3:{var:fight_posx}(i)=37:{var:fight_posy}(i)=5+3*i:next
	'items
		dim {var:item_name}(99),{var:item_atk}(99),{var:item_def}(99),{var:item_level}(99),{var:item_speed}(99),{var:item_mana}(99),{var:item_ident}(99)
	'event variable
		dim {var:event_raum}(12),{var:event_posx}(12),{var:event_posy}(12),{var:event_item}(12)
	'inventar
		dim {var:inventar_slot}(99),{var:inventar_slottemp}(99)
	'tile
		dim {var:map_tile}(111)
	'schlater aktor flag
		dim {var:schalter_raum}(10),{var:schalter_posx}(10),{var:schalter_posy}(10),{var:schalter_flag}(10),{var:aktor_raum}(10),{var:aktor_posx}(10),{var:aktor_posy}(10)
	'npc flag
		dim {var:npc_raum}(10),{var:npc_posx}(10),{var:npc_posy}(10),{var:npc_flag}(10)
		dim sb$(99),si$(5)
'variabeln speicher
	{var:multifarbspeicher_1}  =53282
	{var:multifarbspeicher_2}  =53283
	{var:bildschirmfarbe}      =53281
	{var:rahmenfarbe}          =53280
	{var:bildschirmspeicher}   ={$:c000}
	{var:video_interface_chip} ={$:d000}
	{var:start_map}            ={$:c400}
'variabeln sprite
	{var:sprite0_x}          ={var:video_interface_chip}+0
	{var:sprite0_y}          ={var:video_interface_chip}+1
	{var:sprite1_x}          ={var:video_interface_chip}+2
	{var:sprite1_y}          ={var:video_interface_chip}+3
	{var:sprite2_x}          ={var:video_interface_chip}+4
	{var:sprite2_y}          ={var:video_interface_chip}+5
	{var:sprite3_x}          ={var:video_interface_chip}+6
	{var:sprite3_y}          ={var:video_interface_chip}+7
	{var:sprite4_x}          ={var:video_interface_chip}+8
	{var:sprite4_y}          ={var:video_interface_chip}+9
	{var:sprite5_x}          ={var:video_interface_chip}+10
	{var:sprite5_y}          ={var:video_interface_chip}+11
	{var:sprite6_x}          ={var:video_interface_chip}+12
	{var:sprite6_y}          ={var:video_interface_chip}+13
	{var:sprite7_x}          ={var:video_interface_chip}+14
	{var:sprite7_y}          ={var:video_interface_chip}+15
	{var:sprite_x_highbit}   ={var:video_interface_chip}+16 '{%:00000000}

	{var:sprite_on_off}      ={var:video_interface_chip}+21 '{%:00000000}
	{var:sprite_multi_on_off}={var:video_interface_chip}+28 '{%:00000000}
	{var:sprite_multicolor_1}={var:video_interface_chip}+37
	{var:sprite_multicolor_2}={var:video_interface_chip}+38
	{var:sprite_hirescolor}  ={var:video_interface_chip}+39
	{var:sprite_register}    =50168                         'ende bidschirmspeicher c3f8 sprite 0
'variabeln farben
	{var:farbe_sw}          =0
	'{var:farbe_ws}         =1
	'{var:farbe_rd}         =2
	'{var:farbe_tk}         =3
	'{var:farbe_vi}         =4
	'{var:farbe_gn}         =5
	{var:farbe_bl}          =6
	'{var:farbe_ge}         =7
	{var:farbe_or}          =8
	{var:farbe_br}          =9
	'{var:farbe_lrd}        =10
	{var:farbe_dgr}         =11
	'{var:farbe_mgr}        =12
	'{var:farbe_lgn}        =13
	'{var:farbe_lbl}        =14
	'{var:farbe_lgr}        =15
'variabeln farben multi
	'{var:farbe_multi_sw}   =8
	'{var:farbe_multi_ws}   =9
	'{var:farbe_multi_br}   =10
	'{var:farbe_multi_tk}   =11
	'{var:farbe_multi_vi}   =12
	'{var:farbe_multi_gn}   =13
	'{var:farbe_multi_bl}   =14
	'{var:farbe_multi_ge}   =15
'variabel integer
	rs=160: 'pro raum 160 data
'konstante Variabel string
	dd$="{home}{down:20}{white}"
	cd$="{down:25}"
'read monster
	for i=0 to 13
		read {var:monster_name}(i),{var:monster_hp}(i),{var:monster_mp}(i),{var:monster_level}(i)
		read {var:monster_atk}(i),{var:monster_def}(i),{var:monster_speed}(i),{var:monster_exp}(i)
	next
'read player
	for i=0 to 3
		read {var:player_name}(i),{var:player_hp}(i),{var:player_mp}(i),{var:player_level}(i)
		read {var:player_atk}(i),{var:player_def}(i),{var:player_speed}(i),{var:player_waffe}(i),{var:player_ruestung}(i)
	next
'read item
	for i=0 to 99
		read {var:item_name}(i),{var:item_atk}(i),{var:item_def}(i),{var:item_level}(i),{var:item_speed}(i),{var:item_mana}(i),{var:item_ident}(i)
	next
'read tile
	for i=0 to 111
		read {var:map_tile}(i)
	next
'copy tile player
	{var:player_tile}(0) = {var:map_tile}(48) 'kron
	{var:player_tile}(1) = {var:map_tile}(50) 'lena
	{var:player_tile}(2) = {var:map_tile}(52) 'dolm
	{var:player_tile}(3) = {var:map_tile}(51) 'mira
'copy tile monster
	zz=64
	for i=0 to 13
	{var:monster_tile}(i) = {var:map_tile}(zz)
	zz=zz+1
	next i
'sprite speicherbank zeichensatz color
	{var:spritebank}={$:a0}'                                spritebank $10=$400 versatz von $c000
	poke {var:video_interface_chip}+21,0'                   sprites aus
	poke 648,{$:c0}'                                        bildschirspeicher ab ($c000) hibyte $c0
	poke {$:dd00},0'                                        speicherbank 3    ab ($c000)
	poke {$:d018},{%:00001000}'                             zeichensatz       ab ($e000)
	poke 53270,peek(53270)or16'                             multicolor (ein=16 aus=239)
	poke {var:multifarbspeicher_1},{var:farbe_or}'          multicolor 1 =8 (or)
	poke {var:multifarbspeicher_2},{var:farbe_sw}'          multicolor 2 =0 (sw)
	poke {var:rahmenfarbe},{var:farbe_sw}'                  rahmenfarbe
	poke {var:bildschirmfarbe},{var:farbe_bl}'              bildschirmfarbe

'set raster
	poke 1020,{var:farbe_bl} 'hintergrundfarbe map
	poke 1021,{var:farbe_bl} 'hintergrundfarbe schrift
	sys 820                  'start asm.raster

'
{:start}
gosub {:gosub_raumaktion_variabeln}
{var:seq_select}="nibelheim" :gosub{:gosub_load_game_seq}
goto{:goto_newgame}
'"""""""""""""""""""""""""""""""""""""""""
'mainloop
'"""""""""""""""""""""""""""""""""""""""""
{:mainloop}
	gosub{:gosub_print_rahmen_oben}
	gosub{:gosub_clear_map}
	gosub{:gosub_print_rahmen_unten_map}
	gosub{:gosub_print_player_hp}
{:mainloop_cleartop}
	gb$=""
	gosub{:gosub_clear_top}
	gosub{:gosub_clear_info_txt}
'->mapedit
{:mainloop_print_map}
	'-> sprite off
	poke {var:sprite_on_off},{%:00000000}
	if cr=10 then poke 1020,{var:farbe_dgr} : gb$="schlafender wald"
	if cr=0 or cr=1 or cr=3 or cr=4 or cr=6 or cr=7  then poke 1020,{var:farbe_dgr}  : gb$="nibelheim"
	if cr=8 or cr=5 or cr=2 then poke 1020,{var:farbe_dgr}  : gb$="im haus von lena"

	'-> new
	if cr=0 then ze=0
	if cr=1 then ze=20
	if cr=2 then ze=40

	if cr=3 then ze=480
	if cr=4 then ze=480+20
	if cr=5 then ze=480+40

	if cr=6 then ze=960
	if cr=7 then ze=960+20
	if cr=8 then ze=960+40

	if cr=10 then ze=0
	if cr=11 then ze=20
	if cr=12 then ze=40

	if cr=13 then ze=480
	if cr=14 then ze=480+20
	if cr=15 then ze=480+40

	if cr=16 then ze=960
	if cr=17 then ze=960+20
	if cr=18 then ze=960+40

	cp={var:start_map}+ze	
	
	gosub{:gosub_clear_top}
	gosub{:gosub_print_map}
	print"{home}{down}{right}{white}";gb$	
{:mainloop_print_playertile}
	gosub{:gosub_sprite_player}	
	'if int(ti/60) = 60*15 then gosub{:gosub_raumaktion_variabeln_nachwachsend}
	if cr={var:event_raum}(0) then xe%={var:event_posx}(0) : ye%={var:event_posy}(0) : gosub{:gosub_sprite_apfel}
	if cr={var:event_raum}(1) then xe%={var:event_posx}(1) : ye%={var:event_posy}(1) : gosub{:gosub_sprite_pilz}
{:mainloop_oldpos}
	ox=zx:oy=zy
	zx=x:zy=y
{:mainloop_joyauswertung}
	jm%=1
	gosub{:gosub_joy}	
	if a$="w"  then zy=y-1:goto{:mainloop_if_newpos}
	if a$="a"  then zx=x-1:goto{:mainloop_if_newpos}
	if a$="d"  then zx=x+1:goto{:mainloop_if_newpos}
	if a$="s"  then zy=y+1:goto{:mainloop_if_newpos}
	if a$="fu" then jm%=0 : goto {:goto_inventar}
	if a$="fd" then jm%=0 : goto {:goto_equipment}	

	if a$=chr$(13) and ut$="gefunden" then jm%=0 :gosub{:gosub_raumaktion_gefunden} :ut$="":goto{:mainloop_oldpos}
	if a$=chr$(13) and ut$="schalter" then jm%=0 :gosub{:gosub_raumaktion_schalter} :ut$="":goto{:mainloop_oldpos}
	if a$=chr$(13) and ut$="schlafen" then jm%=0 :gosub{:gosub_raumaktion_schlafen} :ut$="":goto{:mainloop_oldpos}

	goto {:mainloop_joyauswertung}
{:mainloop_if_newpos}	
	'delete ut$
		ut$=""
	'wenn event(x) = find item passt
		aa%=0
		for i=0 to 12
		if {var:event_raum}(i)=cr and {var:event_posx}(i)=zx and {var:event_posy}(i)=zy then aa%=1
		next i
	'wenn am rand der map
		if zx=-1 or zx=20 or zy=-1 or zy=8 then{:mainloop_set_newpos}
	'read nextpos map
	'-> new
		c=peek(cp+zx+zy*60)
	'"""""""""""""""""""""""""""""""""""""""""""""""""
	'wenn nextpos
	'"""""""""""""""""""""""""""""""""""""""""""""""""

		
		if c>=80 and c<=111 then {:mainloop_set_newpos}	'wenn c=80-100 begehbar
		if c=7              then {:mainloop_set_newpos}	'wenn c=07 bruecke

		if c=09  then {:goto_raumaktion_durchgang}      'wenn c=09 leiter
		if c=10  then {:goto_raumaktion_durchgang}      'wenn c=10 brunnen
		if c=11  then {:goto_raumaktion_durchgang}      'wenn c=11 tuere

		if c=12  then {:goto_raumaktion_ausrufezeichen} 'wenn c=12 truhe
		if c=14  then {:goto_raumaktion_ausrufezeichen} 'wenn c=14 schalter aus
		if c=15  then {:goto_raumaktion_ausrufezeichen} 'wenn c=15 schalter an
		if c=24  then {:goto_raumaktion_ausrufezeichen} 'wenn c=24 grass
		if c=25  then {:goto_raumaktion_ausrufezeichen} 'wenn c=25 baum
		if c=21  then {:goto_raumaktion_ausrufezeichen} 'wenn c=21 bett oben
		if c=37  then {:goto_raumaktion_ausrufezeichen} 'wenn c=37 bett unten

		if c=13  then {:goto_raumaktion_fragezeichen}   'wenn c=13 tuere

		if c>=48 and c<=79 then {:goto_raumaktion_npc}  'wenn 48-79 npc

		goto {:mainloop_oldpos}                			'else
{:mainloop_set_newpos}
	'sprite 1 off
		bi%={%:00000010}:gosub{:gosub_sprite_off}
	'loesche info txt}
		gosub {:gosub_clear_info_txt}
	'zufall monster
		'if cr=2 and rnd(1)*100>97 then ff=3 : goto{:battel}
		'if cr=2 and rnd(1)*100>97 then ff=11 : goto{:battel}
		'if cr=2 and rnd(1)*100>97 then ff=int(rnd(1)*3)+1 : goto{:battel}
	'set newpos
		x=zx:y=zy
	'"""""""""""""""""""""""""""""""""""""""""""""""""
	'wenn neuer raum
	'"""""""""""""""""""""""""""""""""""""""""""""""""

		'"""""""""""""""""""""""""""""""""""""""""""""""""
		'links
		'"""""""""""""""""""""""""""""""""""""""""""""""""
		if x=-1 and cr=1 then x=19 : cr=0 : goto{:mainloop_print_map}
		if x=-1 and cr=7 then x=19 : cr=6 : goto{:mainloop_print_map}

		'"""""""""""""""""""""""""""""""""""""""""""""""""
		'rechts
		'"""""""""""""""""""""""""""""""""""""""""""""""""
		if x=20 and cr=0 then x=0 : cr=1 : goto{:mainloop_print_map}
		if x=20 and cr=6 then x=0 : cr=7 : goto{:mainloop_print_map}

		'"""""""""""""""""""""""""""""""""""""""""""""""""
		'auf
		'"""""""""""""""""""""""""""""""""""""""""""""""""
		if y=-1 and cr=3 then  y=7 : cr=0 :goto{:mainloop_print_map}
		if y=-1 and cr=4 then  y=7 : cr=1 :goto{:mainloop_print_map}
		if y=-1 and cr=6 then  y=7 : cr=3 :goto{:mainloop_print_map}
		if y=-1 and cr=7 then  y=7 : cr=4 :goto{:mainloop_print_map}
		if y=-1 and cr=8 then  y=7 : cr=5 :goto{:mainloop_print_map}
		if y=-1 and cr=5 then  y=7 : cr=2 :goto{:mainloop_print_map}

		if y=-1 and cr=10 then y=7 :cr=6 :ml$="map0":gosub{:gosub_load_map}:gosub{:gosub_raumaktion_poke_mapspeicher}:goto{:mainloop_print_map}

		'"""""""""""""""""""""""""""""""""""""""""""""""""
		'ab
		'"""""""""""""""""""""""""""""""""""""""""""""""""
		if y=8 and cr=0 then y=0 : cr=3  :goto{:mainloop_print_map}
		if y=8 and cr=1 then y=0 : cr=4  :goto{:mainloop_print_map}
		if y=8 and cr=4 then y=0 : cr=7  :goto{:mainloop_print_map}
		if y=8 and cr=3 then y=0 : cr=6  :goto{:mainloop_print_map}
		if y=8 and cr=5 then y=0 : cr=8  :goto{:mainloop_print_map}
		if y=8 and cr=2 then y=0 : cr=5  :goto{:mainloop_print_map}


		if y=8 and cr=6 then y=0 : cr=10 :ml$="map1":gosub{:gosub_load_map}::gosub{:gosub_raumaktion_poke_mapspeicher}:goto{:mainloop_print_map}

		'"""""""""""""""""""""""""""""""""""""""""""""""""
		'end of map
		'"""""""""""""""""""""""""""""""""""""""""""""""""
		if x=-1         then x=0 : goto{:mainloop_print_playertile}
		if x=20         then x=19: goto{:mainloop_print_playertile}
		if y=-1         then y=0 : goto{:mainloop_print_playertile}
		if y=8          then y=7 : goto{:mainloop_print_playertile}



	'"""""""""""""""""""""""""""""""""""""""""""""""""
	'else
	'"""""""""""""""""""""""""""""""""""""""""""""""""
		goto{:mainloop_print_playertile}

'->mapedit
{:goto_raumaktion_durchgang}
	'haus
		if cr=3  and y=4 then cr=8:x=10:y=6  :goto{:mainloop_print_map}
		if cr=8  and y=6 then cr=3 :x=5 :y=4 :goto{:mainloop_print_map}
	goto{:mainloop_print_map}
{:goto_raumaktion_ausrufezeichen}
	gosub{:gosub_clear_info_txt}
	'aktion truhe
		if c=12  and aa%=0 then goto {:mainloop_oldpos}
		if c=12  and aa%=1 then gosub{:gosub_sprite_aurufezeichen}:ut$="gefunden"  :goto{:mainloop_oldpos}
	'aktion grass
		if c=24 and aa%=0  then goto {:mainloop_oldpos}
		if c=24 and aa%=1  then gosub{:gosub_sprite_aurufezeichen} :ut$="gefunden" :goto{:mainloop_oldpos}
	'aktion baum
		if c=25 and aa%=0  then goto {:mainloop_oldpos}
		if c=25 and aa%=1  then gosub{:gosub_sprite_aurufezeichen} :ut$="gefunden" :goto{:mainloop_oldpos}
	'aktion bett
		if c=21 then gosub{:gosub_sprite_aurufezeichen}: ut$="schlafen" :goto{:mainloop_oldpos}
		if c=37 then gosub{:gosub_sprite_aurufezeichen}: ut$="schlafen" :goto{:mainloop_oldpos}
	'aktion schalter
		if c=14 and a$="w" then gosub{:gosub_sprite_aurufezeichen}: ut$="schalter" :goto{:mainloop_oldpos}
		if c=15 and a$="w" then gosub{:gosub_sprite_aurufezeichen}: ut$="schalter" :goto{:mainloop_oldpos}

	'else
		goto{:mainloop_oldpos}
{:goto_raumaktion_fragezeichen}
	gosub{:gosub_clear_info_txt}
	'aktion tuere
		'va$="abgeriegelt.." : gosub{:gosub_print_info_txt}
		if c=13 then gosub{:gosub_sprite_fragezeichen}:goto{:mainloop_oldpos}
	'else
		goto{:mainloop_oldpos}
{:goto_raumaktion_npc}
	'player
		if c=50 then {var:seq_select}="lena"  : pt=1 : pa=1  : {var:npc_flag}(0)=1 : gosub{:gosub_raumaktion_poke_mapspeicher} : {var:player_activ}(1)=1 :gosub{:gosub_print_txt_game} :gosub{:gosub_print_map} :goto{:mainloop_oldpos}  
		if c=52 then {var:seq_select}="dolm"  : pt=1 : pa=2  : {var:npc_flag}(1)=1 : gosub{:gosub_raumaktion_poke_mapspeicher} : {var:player_activ}(2)=1 :gosub{:gosub_print_txt_game} :gosub{:gosub_print_map} :goto{:mainloop_oldpos}
		if c=51 then {var:seq_select}="mira"  : pt=1 : pa=3  : {var:npc_flag}(2)=1 : gosub{:gosub_raumaktion_poke_mapspeicher} : {var:player_activ}(3)=1 :gosub{:gosub_print_txt_game} :gosub{:gosub_print_map} :goto{:mainloop_oldpos}
	'monster
		if c=67 then {var:seq_select}="nacho" : pt=1 : ma=3  : gosub{:gosub_print_txt_game} : if ch=0 then goto{:mainloop_oldpos} :ff=4 :{var:npc_flag}(3)=1 :goto{:battel}
		if c=72 then {var:seq_select}="troll" : pt=1 : ma=8  : gosub{:gosub_print_txt_game} : if ch=0 then goto{:mainloop_oldpos} :ff=9 :{var:npc_flag}(4)=1 :goto{:battel}
		if c=76 then {var:seq_select}="dracu" : pt=1 : ma=12 : gosub{:gosub_print_txt_game} : if ch=0 then goto{:mainloop_oldpos} :ff=13:{var:npc_flag}(5)=1 :goto{:battel}
		if c=77 then {var:seq_select}="glado" : pt=1 : ma=13 : gosub{:gosub_print_txt_game} : if ch=0 then goto{:mainloop_oldpos} :ff=14:{var:npc_flag}(6)=1 :goto{:battel}
{:gosub_raumaktion_gefunden}
	bi%={%:00000010}:gosub{:gosub_sprite_off}	
	gosub {:gosub_clear_info_txt}
	ei=0
	{:gefunden_loop}
	'item im raum und pos
		if {var:event_raum}(ei)<>cr or {var:event_posx}(ei)<>ox or {var:event_posy}(ei)<>oy then {:gefunden_next}
	'add item inventar
		{var:nimm_item}={var:event_item}(ei) : gosub{:gosub_add_item_inventar}
	'inventar max
		if is=49 then va$="du kannst nicht mehr tragen" : gosub{:gosub_print_info_txt} :return
	'loesche event item
		{var:event_raum}(ei)=-1
	'inventar print
		if {var:item_ident}({var:inventar_slot}(is))=2 then bi%={%:00000100}:gosub{:gosub_sprite_off}
		va$="gefunden: "+{var:item_name}({var:inventar_slot}(is)): gosub{:gosub_print_info_txt} : return
	{:gefunden_next}
		'wenn ei=max
		ei=ei+1
		if ei=12 then return
		goto{:gefunden_loop}
{:gosub_raumaktion_schalter}
	bi%={%:00000010}:gosub{:gosub_sprite_off}
	'wenn c=14 schalter
		va$="click!" : gosub{:gosub_print_info_txt}
		if (c=14 or 15) and cr={var:schalter_raum}(0) and x={var:schalter_posx}(0) then {var:schalter_flag}(0)=1-{var:schalter_flag}(0):gosub{:gosub_raumaktion_poke_mapspeicher}:gosub{:gosub_print_map}:return
		if (c=14 or 15) and cr={var:schalter_raum}(1) and x={var:schalter_posx}(1) then {var:schalter_flag}(1)=1-{var:schalter_flag}(1):gosub{:gosub_raumaktion_poke_mapspeicher}:gosub{:gosub_print_map}:return
		if (c=14 or 15) and cr={var:schalter_raum}(2) and x={var:schalter_posx}(2) then {var:schalter_flag}(2)=1-{var:schalter_flag}(2):gosub{:gosub_raumaktion_poke_mapspeicher}:gosub{:gosub_print_map}:return
		stop
{:gosub_raumaktion_schlafen}
	bi%={%:00000010}:gosub{:gosub_sprite_off}
	bi%={%:00000001}:gosub{:gosub_sprite_off}
	va$="zzzzz!" : gosub{:gosub_print_info_txt}
	'poke 1020,{var:farbe_sw}
	gosub{:gosub_delay_text}
	'poke 1020,{var:farbe_dgr}
	gosub{:gosub_heilen} : gosub{:gosub_print_player_hp} : gosub{:gosub_clear_info_txt}
	bi%={%:00000001}:gosub{:gosub_sprite_on}
	return
{:gosub_raumaktion_variabeln}
	'variable npc
		{var:npc_raum}(0)=1      :{var:npc_posx}(0)=10      :{var:npc_posy}(0)=4      :{var:npc_flag}(0)=0
	'variabeln schalter aktor c=14 schalter c=3 tuere
		{var:schalter_raum}(0)=8 : {var:schalter_posx}(0)=6 :{var:schalter_posy}(0)=0 :{var:schalter_flag}(0)=0
		{var:schalter_raum}(1)=8 : {var:schalter_posx}(1)=7 :{var:schalter_posy}(1)=0 :{var:schalter_flag}(1)=0
		{var:schalter_raum}(2)=8 : {var:schalter_posx}(2)=8 :{var:schalter_posy}(2)=0 :{var:schalter_flag}(2)=0
		{var:aktor_raum}(0)=8    : {var:aktor_posx}(0)=10   :{var:aktor_posy}(0)=0
	'event
		'event(x) = find item bei gefunden event_raum(x) = -1 else raumnummer
		{var:event_raum}(10)=3  :{var:event_posx}(10)=13    :{var:event_posy}(10)=1   :{var:event_item}(10)=1 'dolch
		{var:event_raum}(11)=8  :{var:event_posx}(11)=13    :{var:event_posy}(11)=4   :{var:event_item}(11)=2 'helm
	{:gosub_raumaktion_variabeln_nachwachsend}
		{var:event_raum}(0)=3   :{var:event_posx}(0)=8      :{var:event_posy}(0)=4    :{var:event_item}(0)=8  'apfel
		{var:event_raum}(1)=0   :{var:event_posx}(1)=9      :{var:event_posy}(1)=1    :{var:event_item}(1)=3  'pilz
	return
{:gosub_raumaktion_poke_mapspeicher}
	'map offset
		'cr=0 or cr=10 -> offset=0
		'cr=1 or cr=11 -> offset=20
		'cr=2 or cr=12 -> offset=40
		'cr=3 or cr=13 -> offset=480
		'cr=4 or cr=14 -> offset=500
		'cr=5 or cr=15 -> offset=520
		'cr=6 or cr=16 -> offset=960
		'cr=7 or cr=17 -> offset=980
		'cr=8 or cr=18 -> offset=1000
	if cr <=8 then             goto {:raumaktion_poke_mapspeicher_map0}
	if cr>=10 and cr <=18 then goto {:raumaktion_poke_mapspeicher_map1}
	'else
	return
	{:raumaktion_poke_mapspeicher_map0}
		'npc raum
		poke {var:start_map}+20+{var:npc_posx}(0)+{var:npc_posy}(0)*60,50+{var:npc_flag}(0)*30  'c=50 lena (kann 50 oder 80 sein)

		'schalter aktor raum 8 (1000) c=14 schalter c=3 tuere
		poke {var:start_map}+1000+{var:schalter_posx}(0)+{var:schalter_posy}(0)*60,14+{var:schalter_flag}(0)
		poke {var:start_map}+1000+{var:schalter_posx}(1)+{var:schalter_posy}(1)*60,14+{var:schalter_flag}(1)
		poke {var:start_map}+1000+{var:schalter_posx}(2)+{var:schalter_posy}(2)*60,14+{var:schalter_flag}(2)

		if {var:schalter_flag}(0)=1  and {var:schalter_flag}(1)=0  and {var:schalter_flag}(2)=1 then t=82 :goto {:raumaktion_poke_mapspeicher_map0_aktor0}
		t=13 :goto {:raumaktion_poke_mapspeicher_map0_aktor0}
		return
		{:raumaktion_poke_mapspeicher_map0_aktor0}
		poke {var:start_map}+1000+{var:aktor_posx}(0)+{var:aktor_posy}(0)*60,t
		return
	{:raumaktion_poke_mapspeicher_map1}
		'npc raum 10 (0) c=50 lena 
		'poke {var:start_map}+0 +{var:npc_posx}(0)+{var:npc_posy}(0)*60,50-{var:npc_flag}(0)*50
		return
{:goto_inventar}
	gosub{:gosub_clear_top}
	gosub {:gosub_clear_info_txt}
	'-> sprite all off
	poke {var:sprite_on_off},{%:00000000}
	poke 1020,{var:farbe_sw} 'hintergrundfarbe map
	gosub{:gosub_print_rahmen_mitte}
	'                               123456789a123456789b123456789c12345678
	print"{home}{down}{right}{white}inventar: waehle dein item           ";
	mt=2:mx=2:my=4:mc=14:ee=2 
	gosub{:gosub_menu_item}
	if ee=4 then ee=0 : gosub{:gosub_clear_map}:goto{:mainloop_cleartop}
	ee=0
	if {var:inventar_slot}(m)=9 then gosub{:gosub_clear_map}:goto{:mainloop_cleartop}
	if {var:inventar_slot}(m)=0 or {var:item_ident}({var:inventar_slot}(m))<>mt then gosub{:gosub_clear_map}:goto{:mainloop_cleartop}
	if {var:inventar_slot}(m)=3 then gosub{:inventar_auswahl_pilz} :{var:inventar_slot}(m)=0:gosub{:gosub_print_player_hp}:gosub{:gosub_clear_map}:goto{:mainloop_cleartop}
	if {var:inventar_slot}(m)=8 then gosub{:inventar_auswahl_apfel}:{var:inventar_slot}(m)=0:gosub{:gosub_print_player_hp}:gosub{:gosub_clear_map}:goto{:mainloop_cleartop}
	gosub{:gosub_clear_map}:goto{:mainloop_cleartop}
	{:inventar_auswahl_apfel}
		for i=0 to 3:{var:player_hp}(i)={var:player_hp}(i)+{var:item_mana}({var:inventar_slot}(m)):if {var:player_hp}(i)>{var:player_hp_max}(i)then {var:player_hp}(i)={var:player_hp_max}(i)
		{var:fight_hp}(i)={var:player_hp}(i):next:return
	{:inventar_auswahl_pilz}
		for i=0 to 3:{var:player_mp}(i)={var:player_mp}(i)+{var:item_mana}({var:inventar_slot}(m)):if {var:player_mp}(i)>{var:player_mp_max}(i)then {var:player_mp}(i)={var:player_mp_max}(i)
		{var:fight_mp}(i)={var:player_mp}(i):next:return
{:goto_equipment}
	'start
		gosub{:gosub_clear_top}
		gosub {:gosub_clear_info_txt}
		'-> all sprite off
		poke {var:sprite_on_off},{%:00000000}
		poke 1020,{var:farbe_sw} 'hintergrundfarbe map
		pj=0
	{:equipment_ini}
		gosub {:gosub_clear_top}
		gosub {:gosub_equipment_rahmen}
		'                               123456789a123456789b123456789c12345678
		print"{home}{down}{right}{white}equipment: waehle deinen spieler     ";
		a=1:a$=""
		va$=""
		p=pj
	{:equipment_joy}
		cp={var:bildschirmspeicher}+2+(4-8*(p>1))*40:if p=1 or p=3 then cp=cp+20
		poke cp,35 : 'print cursor
		gosub{:gosub_joy}
		poke cp,32 : 'print leerzeichen

		if a$="fd" then gosub{:gosub_clear_map}:goto{:mainloop_cleartop}

		if p=0 and a$="d" and {var:player_activ}(1)=1 then p=1 : pj=1 : goto{:equipment_joy}
		if p=0 and a$="s" and {var:player_activ}(2)=1 then p=2 : pj=2 : goto{:equipment_joy}
		'sonderfall
		if p=0 and a$="d" and {var:player_activ}(1)=o and {var:player_activ}(2)=0 and {var:player_activ}(3)=1 then p=3 : pj=3 : goto{:equipment_joy}
		if p=0 and a$="s" and {var:player_activ}(1)=o and {var:player_activ}(2)=0 and {var:player_activ}(3)=1 then p=3 : pj=3 : goto{:equipment_joy}

		if p=1 and a$="a" and {var:player_activ}(0)=1 then p=0 : pj=0 : goto{:equipment_joy}
		if p=1 and a$="s" and {var:player_activ}(3)=1 then p=3 : pj=3 : goto{:equipment_joy}

		if p=2 and a$="d" and {var:player_activ}(3)=1 then p=3 : pj=3 : goto{:equipment_joy}
		if p=2 and a$="w" and {var:player_activ}(0)=1 then p=0 : pj=0 : goto{:equipment_joy}

		if p=3 and a$="a" and {var:player_activ}(2)=1 then p=2 : pj=2 : goto{:equipment_joy}
		if p=3 and a$="w" and {var:player_activ}(1)=1 then p=1 : pj=1 : goto{:equipment_joy}
		'sonderfall
		if p=3 and a$="a" and {var:player_activ}(2)=o and {var:player_activ}(1)=0 and {var:player_activ}(0)=1 then p=0 : pj=0 : goto{:equipment_joy}
		if p=3 and a$="w" and {var:player_activ}(2)=o and {var:player_activ}(1)=0 and {var:player_activ}(0)=1 then p=0 : pj=0 : goto{:equipment_joy}

		if a$=chr$(13)then {:equipment_attribut}

		goto{:equipment_joy}

	{:equipment_attribut}
		em=0:cp=cp+81
		'                               123456789a123456789b123456789c12345678
		print"{home}{down}{right}{white}equipment: waehle dein attribut      ";
	{:attribut_joy}
		poke cp+em*40,35
		gosub{:gosub_joy}
		poke cp+em*40,32
		if a$="s" and em<2 then em=em+1
		if a$="w" and em>0 then em=em-1
		if a$="fd" then gosub{:gosub_clear_map}:goto{:mainloop_cleartop}
		'if a$="fr" then goto{:equipment_ini}
		if a$=chr$(13) then {:equipment_item}
		goto{:attribut_joy}

	{:equipment_item}
		if em=0 then sl=0
		if em=1 then sl=1
		if em=2 then sl=4
		my=4:mx=22:mc=14:ifp=1orp=3thenmx=2
		'                                            123456789a123456789b123456789c12345678
		if sl=0 then print"{home}{down}{right}{white}equipment: waehle deine waffe        ";
		if sl=1 then print"{home}{down}{right}{white}equipment: waehle deine ruestung     ";
		if sl=4 then print"{home}{down}{right}{white}equipment: waehle dein relikt        ";
		print"{home}"left$(cd$,my-1)spc(mx-2);"{brown}{$c1}{$c2:18}{$c3}";
		fori=0to13:print"{down}{left:20}{$c4}                  {$c5}";:next
		print"{down}{left:20}{$c6}{$c7:18}{$c8}";
		mt=sl:ee=1:gosub {:gosub_menu_item}
		if ee=4 then ee=0 : gosub{:gosub_clear_map}:goto{:mainloop_cleartop}
		ee=0

		'zurueck item ident 9=zurueck
			if {var:item_ident}({var:inventar_slot}(m))=9 then gosub {:gosub_clear_top}:goto{:equipment_ini}
		'item ident <> sl=0 waffe sl=1 ruestung
			if {var:inventar_slot}(m)<>0 and {var:item_ident}({var:inventar_slot}(m))<>sl then gosub {:gosub_clear_top}:goto{:equipment_ini}
		'ausruesten sl=0 waffe
			if sl=0 then q={var:player_waffe}(p)   :{var:player_waffe}(p)={var:inventar_slot}(m)   :{var:inventar_slot}(m)=q :gosub {:gosub_clear_top}:goto{:equipment_ini}
		'ausruesten sl=1 ruestung
			if sl=1 then q={var:player_ruestung}(p):{var:player_ruestung}(p)={var:inventar_slot}(m) :{var:inventar_slot}(m)=q :gosub {:gosub_clear_top}:goto{:equipment_ini}
		'ausruesten sl=4 element
			if sl=4 then q={var:player_relikt}(p):{var:player_relikt}(p)={var:inventar_slot}(m) :{var:inventar_slot}(m)=q :gosub {:gosub_clear_top}:goto{:equipment_ini}
'
'"""""""""""""""""""""""""""""""""""""""""""""""""
'battel
'"""""""""""""""""""""""""""""""""""""""""""""""""
	'fight_active(xx) -1        = player/monster tot
	'fight_active(xx) -2/4/7/.. = player/monster aktiv
	'"""""""""""""""""""""""""""""""""""""""""""""""""
	'
	'""""""""""""""""""""""""""""""""""""""""""
	'attack_damage
	'
	'	ap=fight_atk(c)-fight_def(ce)
	'	ap=ap-int(rnd(0)*(ap/2))
	'""""""""""""""""""""""""""""""""""""""""""
	'magic_damage
	'
	'	ap=item_mana(m)+2 - rnd 0-5
	'	ap=ap+fight_level(c)*3
	'""""""""""""""""""""""""""""""""""""""""""
	'heal_magic
	'
	'	ap=item_mana(m)*4+2 - rnd(0-5)
	'	ap=ap+fight_level(c)*3
	'""""""""""""""""""""""""""""""""""""""""""
	'blind_magic
	'
	'	fight_level(ce)=fight_level(ce)/2
	'	fight_level(ce) min 5
	'""""""""""""""""""""""""""""""""""""""""""

{:battel}
	'start
		jm%=0		
		gosub{:gosub_clear_top}
		'-> player sprite off
		poke {var:sprite_on_off},{%:00000000}
		poke 1020,{var:farbe_bl}
		gosub{:gosub_clear_map}				
	'set fight(xx)
		gosub{:gosub_battel_set_fight(xx)_player}
		gosub{:gosub_battel_set_fight(xx)_monster_aktive}
		cc=cc-4
	'clear map
		print"{home}{down:3}{white}";:for i=0 to 15:print"                                        ";:next
	'print rahmen mit hp player
		gosub{:gosub_print_rahmen_unten_battel}
		gosub{:gosub_print_player_hp}
		gosub{:gosub_battel_print_all_player_tile}
		gosub{:gosub_battel_print_monster_hp}
		gosub{:gosub_battel_print_all_monster_tile}
{:battel_routine_ini}
	gosub{:gosub_clear_top}
{:battel_routine_loop}
	c=0
{:battel_routine}
	'""""""""""""""""""""""""""""""""""""""""""
	'check ob fight_speed(0-11) > 100
	'""""""""""""""""""""""""""""""""""""""""""
	if {var:fight_active}(c) =-1 then {var:fight_speed}(c)=0
	if {var:fight_active}(c)<>-1 and {var:fight_speed}(c)>=100 then {var:fight_speed}(c)={var:fight_basis_speed}(c):goto{:battel_routine_attack}
	c=c+1
	if c<12 then{:battel_routine}

	'""""""""""""""""""""""""""""""""""""""""""
	'fight_rnd=fight_speed+fight_speed
	'""""""""""""""""""""""""""""""""""""""""""
	for i=0 to 11
		if {var:fight_active}(i)<>-1 then {var:fight_speed}(i)={var:fight_speed}(i)+{var:fight_speed}(i)
		'if {var:fight_active}(i) =-1 then {var:fight_speed}(i)=0
	next
	goto{:battel_routine_loop}

	'""""""""""""""""""""""""""""""""""""""""""
	'set attack
	'""""""""""""""""""""""""""""""""""""""""""

	{:battel_routine_attack}
		if {var:fight_active}(c)=-2then{:battel_player_attack}
		goto{:battel_monster_attack}
{:battel_player_attack}
{:battelmenu}
	gosub{:gosub_clear_top}
	'                                                 123456789a123456789b123456789c12345678
	print"{home}{white}{down}{right}"{var:player_name}(c)": ist am zug                     "
	print dd$;spc(16)"{white} angriff {down}{left:9} inventar";:m=2
	print dd$;spc(16)"{down:2}{$20:9}{down}{left:9}{$20:9}";
	if {var:player_mp}(c)>0then print dd$;spc(16)"{down:2} magie   ";:m=3
	'print player tile aktiv
	gosub{:gosub_battel_print_current_player_tile}
	my=0 : fz=0
{:battelmenu_print_cusor}
	'bildschirmspeicher 49152 + 816 (pro zeile 40 zeichen 0-39)
	poke {var:bildschirmspeicher}+816+my*40,35 : 'print cursor
{:battelmenu_joyauswertung}
	gosub{:gosub_joy}
	'bildschirmspeicher -1
	if a$="s"then poke {var:bildschirmspeicher}+816+my*40,32:fz=0:my=my+1:goto {:battelmenu_joyauswertung_min_max}
	if a$="w"then poke {var:bildschirmspeicher}+816+my*40,32:fz=0:my=my-1:goto {:battelmenu_joyauswertung_min_max}
	if a$=chr$(13)then fz=0:goto {:battelmenu_on_goto}
	goto {:battelmenu_joyauswertung}
{:battelmenu_joyauswertung_min_max}
	if my>=m then my=0
	if my<0 then my=m-1
	goto {:battelmenu_print_cusor}
{:battelmenu_on_goto}
	'clear player battelmenu
		printdd$;spc(16)"{white}{$20:9}{down}{left:9}{$20:9}{down}{left:9}{$20:9}";
	'on goto
		on my+1 goto {:battelmenu_select_attack},{:battelmenu_select_item}
'else weiter magic
		mt=3:mx=16:my=20:mc=4:gosub {:gosub_menu_item}
		if {var:item_ident}({var:inventar_slot}(m))=9 then {:battelmenu}
	'clear menuitem
		print dd$;spc(16)"{white}{$20:9}{down}{left:9}{$20:9}{down}{left:9}{$20:9}{down}{left:9}{$20:9}";
		if {var:inventar_slot}(m)=0 or {var:item_ident}({var:inventar_slot}(m))<>3then{:battelmenu}
		m={var:inventar_slot}(m)
	'nicht genug mana
		if {var:item_mana}(m)>{var:fight_mp}(c)then gosub{:gosub_clear_top}:gosub{:gosub_delay_fight}:print"{home}{down}{right}nicht genug mana                     ";:gosub{:gosub_delay_text}:goto{:battelmenu}
	gosub{:gosub_battel_choose_target}
	gosub{:gosub_clear_top}
	'wenn ce < 4
		if ce < 4 and m<>9 then gosub{:gosub_clear_top}:gosub{:gosub_delay_fight}: print"{home}{down}{right}waehle ein neues ziel                ";:gosub{:gosub_delay_text}: goto{:battelmenu}
	'check other magic
		if{var:fight_active}(c)=-2 and m=9  then {:goto_heal_magic}
		if{var:fight_active}(c)=-2 and m=12 then {:goto_blind_magic}
		if{var:fight_active}(c)=7  and {var:fight_mp}(c)>={var:item_mana}(9)then m=9:goto{:goto_heal_magic}
		goto{:battle_magic_damage}
{:battelmenu_select_item}
	mt=2:mx=16:my=20:mc=4:gosub {:gosub_menu_item}
	if {var:item_ident}({var:inventar_slot}(m))=9 then {:battelmenu}
	printdd$;spc(16)"{white}{$20:9}{down}{left:9}{$20:9}{down}{left:9}{$20:9}";
	print"{down}{left:9}{$20:9}";
	if {var:inventar_slot}(m)=0 or {var:item_ident}({var:inventar_slot}(m))<>mt then {:battelmenu}
	if {var:inventar_slot}(m)=3 then gosub {:inventar_auswahl_pilz} :{var:inventar_slot}(m)=0:gosub{:gosub_print_player_hp}:gosub{:gosub_battel_move_current_tile_oldpos}:gosub{:gosub_battel_reanimation}:gosub{:gosub_battel_print_all_player_tile}:goto{:battel_routine_ini}
	if {var:inventar_slot}(m)=8 then gosub {:inventar_auswahl_apfel}: {var:inventar_slot}(m)=0:gosub{:gosub_print_player_hp}:gosub{:gosub_battel_move_current_tile_oldpos}:gosub{:gosub_battel_print_all_player_tile}:goto{:battel_routine_ini}
	gosub{:gosub_battel_move_current_tile_oldpos}:goto {:battel_routine_ini}
{:battelmenu_select_attack}
	gosub {:gosub_battel_choose_target}
	gosub{:gosub_clear_top}
	'wenn ce < 4
		if ce < 4 and m<>9 then gosub{:gosub_clear_top}:gosub{:gosub_delay_fight}: print"{home}{down}{right}ziel nich waehlbar                   ";:gosub{:gosub_delay_text}: goto{:battelmenu}

'attack damage
{:battle_attack_damage}
	'attack power
		ap={var:fight_atk}(c)-{var:fight_def}(ce)
	'miss
		if ap<=0 then print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{left}{white}miss"; : gosub {:gosub_delay_fight} : goto{:battel_delete_attack_damage}
	'attack power
		ap=ap-int(rnd(0)*(ap/2))
	'fight hp minus attack power
		{var:fight_hp}(ce)={var:fight_hp}(ce)-ap
		if{var:fight_hp}(ce) < 0 then{var:fight_hp}(ce)=0
	'player hp = fight hp / wenn fight hp > 0
		if ce < 4 then {var:player_hp}(ce)={var:fight_hp}(ce)
		if {var:fight_hp}(ce) > 0 then goto{:battel_print_attack_damage}
	'wenn fight hp < 0
		if {var:fight_active}(ce)<>-2 then cc=cc-1:wx=wx+{var:monster_exp}({var:fight_active}(ce))
		if {var:fight_active}(ce) =-2 then pp=pp-1
		{var:fight_active}(ce)=-1
{:battel_print_attack_damage}
	'sprite position ini
		poke {var:sprite0_x},({var:fight_posx}(ce)*8+22)and 255        'sprite 0 posx
		poke {var:sprite0_y},{var:fight_posy}(ce)*8+48                 'sprite 0 posy
		poke {var:sprite_x_highbit},-({var:fight_posx}(ce)>30)         'x highbit %00000000 sprite posx
		poke {var:sprite_register},{var:spritebank}                    'datenzeiger sprite 0
		poke {var:sprite_hirescolor},1                                 'sprite color white
		poke {var:sprite_multi_on_off},{%:00000000}                    'sprite multicolor aus
		poke {var:sprite_on_off},{%:00000001}                          'sprite 0 on
	'print damage string
		gosub{:gosub_validate_damage}
		print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{white}";ap$
	'animation sprite
		for i=0 to 5
			gosub{:gosub_delay_sprite}
			poke {var:sprite0_x},peek({var:sprite0_x})+2
			poke {var:sprite0_y},peek({var:sprite0_y})+2
		next i
		poke {var:sprite_on_off},{%:00000000}
	'print player hp
		if ce<4 then gosub{:gosub_print_player_hp}
	'print monster hp
		gosub{:gosub_battel_print_monster_hp}
{:battel_delete_attack_damage}
	'delete damage string
		print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{left}    "
	'print tile
		gosub{:gosub_battel_move_current_tile_oldpos}
	'delete fight tile death
		if{var:fight_active}(ce)=-1thenprint"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce));"  {down}{left:2}  ";

	'gewonnen verloren
		if cc=0 then goto{:goto_battel_gewonnen}
		if pp=0  then goto{:goto_battel_verloren}

	gosub{:gosub_battel_print_all_monster_tile}
	gosub{:gosub_battel_print_all_player_tile}
	goto{:battel_routine_ini}
'magic damage
{:battle_magic_damage}
	'mana kosten = schaden
	ap={var:item_mana}(m)+2-int(rnd(0)*5):{var:fight_mp}(c)={var:fight_mp}(c)-{var:item_mana}(m):{var:player_mp}(c)={var:fight_mp}(c):gosub{:gosub_print_player_hp}
	ap=ap+{var:fight_level}(c)*3
	{var:fight_hp}(ce)={var:fight_hp}(ce)-ap:if{var:fight_hp}(ce)<0then{var:fight_hp}(ce)=0
	ifce<4then{var:player_hp}(ce)={var:fight_hp}(ce)
	if{var:fight_hp}(ce)>0 then goto{:battel_print_magic_damage}
	if{var:fight_active}(ce)<>-2thencc=cc-1:wx=wx+{var:monster_exp}({var:fight_active}(ce))
	if{var:fight_active}(ce)=-2thenpp=pp-1
	{var:fight_active}(ce)=-1
	goto{:battel_print_magic_damage}
{:battel_print_magic_damage}
	'sprite position ini
		if m=4 then b={var:spritebank}+1 : poke {var:sprite_multicolor_1},2  : poke {var:sprite_multicolor_2},7  : poke {var:sprite_hirescolor},1 :poke {var:sprite_multi_on_off},{%:00000001} 'm=4 feuer
		if m=5 then b={var:spritebank}+5 : poke {var:sprite_multicolor_1},14 : poke {var:sprite_multicolor_2},3  : poke {var:sprite_hirescolor},1 :poke {var:sprite_multi_on_off},{%:00000001} 'm=5 polar
		if m=6 then b={var:spritebank}+3 : poke {var:sprite_multicolor_1},11 : poke {var:sprite_multicolor_2},0  : poke {var:sprite_hirescolor},1 :poke {var:sprite_multi_on_off},{%:00000001} 'm=6 groll
		if m=7 then b={var:spritebank}+7 : poke {var:sprite_multicolor_1},2  : poke {var:sprite_multicolor_2},7  : poke {var:sprite_hirescolor},0 :poke {var:sprite_multi_on_off},{%:00000001} 'm=7 bombe
		poke {var:sprite0_x},({var:fight_posx}(ce)*8+24)and 255           'sprite 0 posx
		poke {var:sprite0_y},{var:fight_posy}(ce)*8+50                    'sprite 0 posy
		poke {var:sprite_x_highbit},-({var:fight_posx}(ce)>30)            'x highbit %00000000 sprite posx
		poke {var:sprite_register},b                                      'datenzeiger sprite auf b 16=1. sprite,17=2. sprite,....
		poke {var:sprite_on_off},{%:00000001}                             'sprite 0 on

	'delete tile
		gosub{:gosub_battel_delete_current_enemy_tile}

	'print damage string
		gosub{:gosub_validate_damage}
		print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{white}";ap$
	'animation sprite
		for k=0 to 3
			for i=0 to 1
			poke {var:sprite_register},b+i
			gosub{:gosub_delay_sprite_animation}
			next i
		next k
	'print player hp
		if ce<4 then gosub{:gosub_print_player_hp}
	'print monster hp
		gosub{:gosub_battel_print_monster_hp}
	'delete damage string
		print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{left}    "
		poke {var:sprite_on_off},{%:00000000}
	'print tile
		gosub{:gosub_battel_move_current_tile_oldpos}
	'delete fight tile death
		if{var:fight_active}(ce)=-1 then print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce));"  {down}{left:2}  ";

	'gewonnen verloren
		if cc=0 then{:goto_battel_gewonnen}
		if pp=0  then{:goto_battel_verloren}

	gosub{:gosub_battel_print_all_monster_tile}
	gosub{:gosub_battel_print_all_player_tile}
	goto{:battel_routine_ini}
'other magic
{:goto_heal_magic}
	ap={var:item_mana}(m)*4+2-int(rnd(0)*5):{var:fight_mp}(c)={var:fight_mp}(c)-{var:item_mana}(m):ifc<4then{var:player_mp}(c)={var:fight_mp}(c):gosub{:gosub_print_player_hp}
	ap=ap+{var:fight_level}(c)*3
	{var:fight_hp}(ce)={var:fight_hp}(ce)+ap:if{var:fight_hp}(ce)>{var:fight_hp_max}(ce)then{var:fight_hp}(ce)={var:fight_hp_max}(ce)
	ifce<4then{var:player_hp}(ce)={var:fight_hp}(ce):gosub{:gosub_print_player_hp}

	'sprite position ini
		if m=9 then b={var:spritebank}+9 : poke {var:sprite_multicolor_1},5  : poke {var:sprite_multicolor_2},12  : poke {var:sprite_hirescolor},3:poke {var:sprite_multi_on_off},{%:00000001}
		poke {var:sprite0_x},({var:fight_posx}(ce)*8+24)and 255                          'sprite 0 posx
		if c=ce and c < 4 then poke {var:sprite0_x},({var:fight_posx}(ce)*8+24-8)and 255 'sprite 0 posx player 
		if c=ce and c > 3 then poke {var:sprite0_x},({var:fight_posx}(ce)*8+24+8)and 255 'sprite 0 posx monster
		poke {var:sprite0_y},{var:fight_posy}(ce)*8+50                                   'sprite 0 posy
		poke {var:sprite_x_highbit},-({var:fight_posx}(ce)>30)                           'x highbit %00000000 sprite posx
		poke {var:sprite_register},b                                                     'datenzeiger sprite auf b 16=1. sprite,17=2. sprite,....
		poke {var:sprite_on_off},{%:00000001}                                            'sprite 0 on

	'delete tile
		gosub{:gosub_battel_delete_current_enemy_tile}

	'print heilen string
		gosub{:gosub_validate_damage}
		if c= ce and c < 4 then print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{left}{green}";ap$
		if c= ce and c > 3 then print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{right}{green}";ap$
		if c<>ce           then print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{green}";ap$

	'animation sprite
		for k=0 to 3
			for i=0 to 1
			poke {var:sprite_register},b+i
			gosub{:gosub_delay_sprite_animation}
			next i
		next k
	'print player hp
		if ce < 4 then gosub{:gosub_print_player_hp}
	'print monster hp
		if ce > 3 then gosub{:gosub_battel_print_monster_hp}
		gosub{:gosub_battel_print_monster_hp}
	'delete heilen string
		print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{left}{left}     "
		poke {var:sprite_on_off},{%:00000000}
	'print tile
		gosub{:gosub_battel_move_current_tile_oldpos}

	gosub{:gosub_battel_print_all_monster_tile}
	gosub{:gosub_battel_print_all_player_tile}
	goto{:battel_routine_ini}
{:goto_blind_magic}
	{var:fight_mp}(c)={var:fight_mp}(c)-{var:item_mana}(m):if c<4 then {var:player_mp}(c)={var:fight_mp}(c):gosub{:gosub_print_player_hp}
	{var:fight_level}(ce)={var:fight_level}(ce)/2: if {var:fight_level}(ce) <5 then {var:fight_level}(ce)=5

	'sprite position ini
		if m=12 then b={var:spritebank}+9 : poke {var:sprite_multicolor_1},0  : poke {var:sprite_multicolor_2},12 : poke {var:sprite_hirescolor},3:poke {var:sprite_multi_on_off},{%:00000001}
		poke {var:sprite0_x},({var:fight_posx}(ce)*8+24)and 255           'sprite 0 posx
		poke {var:sprite0_y},{var:fight_posy}(ce)*8+50                    'sprite 0 posy
		poke {var:sprite_x_highbit},-({var:fight_posx}(ce)>30)            'x highbit %00000000 sprite posx
		poke {var:sprite_register},b                                      'datenzeiger sprite auf b 16=1. sprite,17=2. sprite,....
		poke {var:sprite_on_off},{%:00000001}                             'sprite 0 on

	'delete tile
		gosub{:gosub_battel_delete_current_enemy_tile}

	'print blind string
		print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{left}{cyan}#$%&";
	'animation sprite
		for k=0 to 3
			for i=0 to 1
			poke {var:sprite_register},b+i
			gosub{:gosub_delay_sprite_animation}
			next i
		next k
	'print player hp
		if ce < 4 then gosub{:gosub_print_player_hp}
	'print monster hp
		if ce < 3 then gosub{:gosub_battel_print_monster_hp}
	'delete blind string
		print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce))"{up}{left}    "
		poke {var:sprite_on_off},{%:00000000}
	'print tile
		gosub{:gosub_battel_move_current_tile_oldpos}


	gosub{:gosub_battel_print_all_monster_tile}
	gosub{:gosub_battel_print_all_player_tile}
	goto{:battel_routine_ini}

'monster attack
{:battel_monster_attack}
	'delay
		gosub{:gosub_clear_top}
		gosub{:gosub_delay_fight}
		'                                                                    123456789a123456789b123456789c12345678
		print"{white}{home}{down}{right}"{var:monster_name}({var:fight_active}(c))": greift an                    "
	'print monster tile aktiv
		gosub {:gosub_battel_print_current_monster_tile}
		'gosub {:gosub_delay_fight}
	'fight ini
		if{var:fight_active}(c)=7  thenif{var:fight_mp}(c)>={var:item_mana}(9) then m=9 : gosub{:gosub_battel_find_rnd_monster}:gosub{:gosub_delay_fight} :goto{:goto_heal_magic}      ' heilen
		if{var:fight_active}(c)=9  thenif{var:fight_mp}(c)>={var:item_mana}(6) then m=6 : gosub{:gosub_battel_find_rnd_player} :gosub{:gosub_delay_fight} :goto{:battle_magic_damage}  ' groll
		if{var:fight_active}(c)=10 thenif{var:fight_mp}(c)>={var:item_mana}(4) then m=4 : gosub{:gosub_battel_find_rnd_player} :gosub{:gosub_delay_fight} :goto{:battle_magic_damage}  ' feuer
		if{var:fight_active}(c)=11 thenif{var:fight_mp}(c)>={var:item_mana}(12)then m=12: gosub{:gosub_battel_find_rnd_player} :gosub{:gosub_delay_fight} :goto{:goto_blind_magic}     ' blind
	'else weiter
		gosub{:gosub_battel_find_rnd_player} :gosub{:gosub_delay_fight} :goto{:battle_attack_damage}

'gosub battel
{:gosub_battel_choose_target}
	'                                                      123456789a123456789b123456789c12345678
	ce=4:print"{home}{down}{right}{white}"{var:player_name}(c)": waehle dein ziel               "
	'{var:player_name}(c)

	{:choose_target_start}
		if{var:fight_active}(ce)=-1then{:choose_target_plus}
	
	{:choose_target_poke_cursor}
		'bildschirmspeicher 49152 -1 (pro zeile 40 zeichen 0-39)
		'cursor links von target
		poke {var:bildschirmspeicher}-2+{var:fight_posx}(ce)+{var:fight_posy}(ce)*40,35

	{:choose_target_joyauswertung}
		'joyauswertung
			gosub{:gosub_joy}
		'auswahl
			if a$=chr$(13)     then poke {var:bildschirmspeicher}-2+{var:fight_posx}(ce)+{var:fight_posy}(ce)*40,32 :             return                     'print leerzeichen : fire
			if a$="s"          then                                                                                               goto{:choose_target_plus}  '                  : target +
			if a$="w"          then                                                                                               goto{:choose_target_minus} '                  : target -
			if a$="d" and ce>3 then      poke {var:bildschirmspeicher}-2+{var:fight_posx}(ce)+{var:fight_posy}(ce)*40,32 : ce=0 : goto{:choose_target_start} 'print leerzeichen : target player
			if a$="a" and ce<4 then      poke {var:bildschirmspeicher}-2+{var:fight_posx}(ce)+{var:fight_posy}(ce)*40,32 : ce=4 : goto{:choose_target_start} 'print leerzeichen : tagret monster
		goto{:choose_target_joyauswertung}

	{:choose_target_plus}
		co=ce
		'loesche cusor
			poke {var:bildschirmspeicher}-2+{var:fight_posx}(ce)+{var:fight_posy}(ce)*40,32
		{:choose_target_ce+1}
			ce=ce+1
			if ce>= 12       then ce=0  'ce=max
			if co<4 and ce>3 then ce=co 'co=player  and ce=monster
			if co>3 and ce<4 then ce=co 'co=monster and ce=player
			if{var:fight_active}(ce)<>-1then{:choose_target_poke_cursor}
		goto{:choose_target_ce+1}

	{:choose_target_minus}
		co=ce
		'loesche cursor
			poke {var:bildschirmspeicher}-2+{var:fight_posx}(ce)+{var:fight_posy}(ce)*40,32
		{:choose_target_ce-1}
			ce=ce-1
			if ce<0 then          ce=11 'ce=min
			if co<4 and ce>3 then ce=co 'co=player  and ce=monster
			if co>3 and ce<4 then ce=co 'co=monster and ce=player
			if{var:fight_active}(ce)<>-1then{:choose_target_poke_cursor}
		goto{:choose_target_ce-1}
{:gosub_battel_find_rnd_player}
	re=int(rnd(0)*4):ce=0
	{:battel_find_rnd_player_if_ce}
		if {var:fight_active}(ce)=-2 and {var:player_hp}(ce)>0then{:battel_find_rnd_player_if_re}
	{:battel_find_rnd_player_ce+1}
		ce=ce+1:if ce=4 then ce=0
		goto{:battel_find_rnd_player_if_ce}
	{:battel_find_rnd_player_if_re}
		if re>0then re=re-1:goto{:battel_find_rnd_player_ce+1}
		return
{:gosub_battel_find_rnd_monster}
	re=int(rnd(0)*8):ce=4
	{:battel_find_rnd_monster_if_ft}
		if {var:fight_active}(ce)>=0then{:battel_find_rnd_monster_if_re}
	{:battel_find_rnd_monster_ce+1}
		ce=ce+1:ifce=12thence=4
		goto{:battel_find_rnd_monster_if_ft}
	{:battel_find_rnd_monster_if_re}
		if re>0thenre=re-1:goto{:battel_find_rnd_monster_ce+1}
		return
{:gosub_battel_set_fight(xx)_monster_aktive}
	'set alle monster tot
		for i=4 to 11:{var:fight_active}(i)=-1:next
		cc=4
		wx=0
	'set monster fight aktiv
		if ff=3  then a=0: lc=int(rnd(0))*2+2 : for i=0 to lc : gosub{:gosub_battel_set_fight(xx)_monster} :next: return
		if ff=1  then a=1:                      for i=0 to 2  : gosub{:gosub_battel_set_fight(xx)_monster} :next: return
		if ff=2  then a=1:                      for i=0 to 1  : gosub{:gosub_battel_set_fight(xx)_monster} :next: a=2:fori=0to1:gosub{:gosub_battel_set_fight(xx)_monster}:next:return
		if ff=4  then a=3:                                      gosub{:gosub_battel_set_fight(xx)_monster} :a=1: gosub{:gosub_battel_set_fight(xx)_monster} :gosub{:gosub_battel_set_fight(xx)_monster}:return
		if ff=5  then a=4: lc=int(rnd(0)*3)+1 : for i=0 to lc : gosub{:gosub_battel_set_fight(xx)_monster} :next: return
		if ff=6  then on int(rnd(1)*2)+1                        goto {:goto_moss},{:goto_spark}
		if ff=7  then lc=int(rnd(0)*3)+1:a=6  : for i=0 to lc : gosub{:gosub_battel_set_fight(xx)_monster} :next: return
		if ff=8  then a=7:                                      gosub{:gosub_battel_set_fight(xx)_monster} :lc=int(rnd(0)*2)+1:a=6:gosub{:gosub_battel_set_fight(xx)_monster}:return
		if ff=9  then a=9:                                      gosub{:gosub_battel_set_fight(xx)_monster} :a=8 :gosub{:gosub_battel_set_fight(xx)_monster} :a=5 :gosub{:gosub_battel_set_fight(xx)_monster}:return
		if ff=10 then a=6: lc=int(rnd(0)*2)+1 : for i=1 to lc : gosub{:gosub_battel_set_fight(xx)_monster} :next: return
		if ff=11 then a=7:                                      gosub{:gosub_battel_set_fight(xx)_monster} :a=10: gosub{:gosub_battel_set_fight(xx)_monster}:return
		if ff=12 and int(rnd(1)*2)=1then a=11 :                 gosub{:gosub_battel_set_fight(xx)_monster} :return
		if ff=12 then a=5:                                      gosub{:gosub_battel_set_fight(xx)_monster} :gosub{:gosub_battel_set_fight(xx)_monster}: a=9: gosub{:gosub_battel_set_fight(xx)_monster}:return
		if ff=13 then a=9:                                      gosub{:gosub_battel_set_fight(xx)_monster} :a=12 :gosub{:gosub_battel_set_fight(xx)_monster}:a=9 :gosub{:gosub_battel_set_fight(xx)_monster}:return
		if ff=14 then a=9:                                      gosub{:gosub_battel_set_fight(xx)_monster} :a=13 :gosub{:gosub_battel_set_fight(xx)_monster}:a=7 :gosub{:gosub_battel_set_fight(xx)_monster}:return
		{:goto_moss}
		a=5 : lc=int(rnd(1)*2)+1 : for i=0 to lc: gosub{:gosub_battel_set_fight(xx)_monster}:next:return
		{:goto_spark}
		a=9 : lc=int(rnd(1)*2)+1 : for i=1 to lc: gosub{:gosub_battel_set_fight(xx)_monster}:next:return
{:gosub_battel_set_fight(xx)_monster}
	if cc >=11 then return
	{var:fight_hp}(cc)          =       {var:monster_hp}(a)
	{var:fight_mp}(cc)          =       {var:monster_mp}(a)
	{var:fight_active}(cc)      =       a
	{var:fight_speed}(cc)       =       {var:monster_speed}(a)
	{var:fight_basis_speed}(cc) =       {var:monster_speed}(a)
	{var:fight_level}(cc)       =       {var:monster_level}(a)
	{var:fight_rnd_level}(cc)   =       int(rnd(0)*{var:monster_level}(a))+1
	{var:fight_posx}(cc)        =       2
	{var:fight_posy}(cc)        =       5+cc*3
	{var:fight_atk}(cc)         =       {var:monster_atk}(a):{var:fight_def}(cc)={var:monster_def}(a)
	{var:fight_hp_max}(cc)      =       {var:monster_hp}(a):{var:fight_mp_max}(cc)={var:monster_mp}(a)
	if cc>=4 then {var:fight_posx}(cc)=5:{var:fight_posy}(cc)=5+(cc-4)*3
	cc=cc+1
	return
{:gosub_battel_set_fight(xx)_player}
	pp=4
	for i=0 to 3
	{var:fight_active}(i)       =       -2
	{var:fight_hp}(i)           =       {var:player_hp}(i)
	{var:fight_mp}(i)           =       {var:player_mp}(i)
	{var:fight_level}(i)        =       {var:player_level}(i)+{var:item_level}({var:player_relikt}(i))
	{var:fight_rnd_level}(i)    =       int(rnd(0)*{var:fight_level}(i))+1
	{var:fight_speed}(i)        =       {var:player_speed}(i)+{var:item_speed}({var:player_relikt}(i))
	{var:fight_basis_speed}(i)  =       {var:player_speed}(i)+{var:item_speed}({var:player_relikt}(i))
	if {var:player_activ}(i)    =0 then {var:fight_hp}(i)=-1
	if {var:fight_hp}(i)       <=0 then {var:fight_active}(i)=-1 : pp=pp-1 :
	{var:fight_atk}(i)          =       {var:player_atk}(i)+{var:item_atk}({var:player_waffe}(i))+{var:item_atk}({var:player_relikt}(i))
	{var:fight_def}(i)          =       {var:player_def}(i)+{var:item_def}({var:player_ruestung}(i))+{var:item_def}({var:player_relikt}(i))
	{var:fight_hp_max}(i)       =       {var:player_hp_max}(i)
	{var:fight_mp_max}(i)       =       {var:player_mp_max}(i)
	next
	return

{:gosub_battel_reanimation}
	pp=4
	for i=0 to 3
		if {var:player_activ}(i)=1 then {var:fight_active}(i)=-2
	next
	return
{:gosub_battel_print_monster_hp}
	zm=0: 'zaehler montster
	for j=4 to 7
		if {var:fight_active}(j)=-1then zm=zm-1
		zm=zm+1
	next j
	if zm<>cm then printdd$;"{right}{$20:10}{down}{left:10}{$20:10}{down}{left:10}{$20:10}{down}{left:10}{$20:10}";
	printdd$;
	cm=0: 'print
	for i=4 to 7
		if {var:fight_active}(i)=-1 then next:return '{var:fight_active}(x) death=-1
		a={var:fight_hp}(i):gosub{:gosub_validate_hp_mp}
		print"{home}{right}"left$(cd$,20+cm){var:monster_name}({var:fight_active}(i));
		print"{home}{right}"left$(cd$,20+cm);"{right:7}";d$
		cm=cm+1
	next
	return

{:gosub_battel_print_all_monster_tile}
	for i=4 to 11:if {var:fight_active}(i)=-1 then {:monster_tile_next}
	print"{home}"left$(cd$,{var:fight_posy}(i));spc({var:fight_posx}(i));{var:monster_tile}({var:fight_active}(i))
	{:monster_tile_next}
	next
		return
{:gosub_battel_print_all_player_tile}
	for i=0 to 3:if {var:player_hp}(i)<=0 or {var:player_activ}(i)=0 then next:return
	print"{home}"left$(cd$,5+i*3);spc(37);{var:player_tile}(i):next
	return
{:gosub_battel_print_current_player_tile}
	'loeschen playertile right
		print"{home}"left$(cd$,5+c*3)spc(37)"  {down}{left:2}  ";
	'print playertile left
		print"{left:3}{up}"{var:player_tile}(c);
	return
{:gosub_battel_print_current_monster_tile}
	'loeschen monstertile left
		print"{home}"left$(cd$,{var:fight_posy}(c))spc({var:fight_posx}(c));"  {down}{left:2}  ";
	'print monstertile right
		print"{left}{up}"{var:monster_tile}({var:fight_active}(c));
	return
{:gosub_battel_delete_current_enemy_tile}
	'loeschen playertile left
		if c < 4 and c=ce then print"{home}"left$(cd$,5+c*3)spc(36)"  {down}{left:2}  ";
	'loeschen monstertile right
		if c > 3 and c=ce then print"{home}{right}"left$(cd$,{var:fight_posy}(c))spc({var:fight_posx}(c));"  {down}{left:2}  ";
	'loesche fighttile current enemy
		if c<>ce          then print"{home}"left$(cd$,{var:fight_posy}(ce))spc({var:fight_posx}(ce));"  {down}{left:2}  ";
	return
{:gosub_battel_move_current_tile_oldpos}
	'loeschen monstertile right
		if c > 3 then print"{home}{right}"left$(cd$,{var:fight_posy}(c))spc({var:fight_posx}(c));"  {down}{left:2}  ";
	'print monstertile left
		if c > 3 then print"{home}"left$(cd$,{var:fight_posy}(c));spc({var:fight_posx}(c));{var:monster_tile}({var:fight_active}(c))
	'loeschen playertile left
		if c < 4 then print"{home}"left$(cd$,5+c*3)spc(36)"  {down}{left:2}  ";
	'print playertile right
		if c < 4 then print"{home}"left$(cd$,5+c*3)spc(37){var:player_tile}(c);
	return


{:goto_battel_gewonnen}
	poke 1020,{var:farbe_sw} 'hintergrundfarbe map
	'print rahmen ohne hp monster
	printdd$;"{brown}{up}{$c1}{$c2:10}{$c3}{$c1}{$c2:12}{$c3}{$c1}{$c2:5}{white}hp{brown}{$c2:2}{white}mp{brown}{$c2}{$c3}{white}";
	'                        123456789a123456789b123456789c12345678
	print"{home}{down}{right}du hast gewonnen                     ";:gosub{:gosub_battel_print_monster_hp}
	gosub{:gosub_print_rahmen_mitte}
	fori=0to3:if{var:player_activ}(i)=0then{:battel_gewonnen_jmp}
	print"{home}{white}{right:3}";:if{var:player_hp}(i)=0thenprint"{red}";
	printleft$(cd$,4+i*3){var:player_name}(i)

		a={var:player_level}(i)+{var:item_level}({var:player_relikt}(i)) : gosub {:gosub_validate_level}
		b={var:player_exp}(i)                                            : gosub {:gosub_validate_exp}
		print"{home}{white}"left$(cd$,5+i*3)"{right:3}lv ";d$;"   ex ";e$

	{:battel_gewonnen_jmp}
		next
		fori=0to3:if{var:player_hp}(i)=0or{var:player_activ}(i)=0then{:battel_gewonnen_next}
		tx=wx
	{:battel_gewonnen_print_tx}
		print"{home}{white}"left$(cd$,5+i*3)spc(22)"experience {left}"tx"{left} ";
		iftx=0then{:battel_gewonnen_next}
		xs=1:iftx>9thenxs=10
		iftx>99thenxs=100
		tx=tx-xs
		{var:player_exp}(i)={var:player_exp}(i)+xs
		'if {var:player_exp}(i)>999 then {var:player_exp}(i)=999
	{:battel_gewonnen_print_lv_exp}
		ll=10+{var:player_level}(i)*{var:player_level}(i)*10:if{var:player_exp}(i)>=llthengosub{:battel_gewonnen_add_lv_exp}:goto{:battel_gewonnen_print_lv_exp}

		a={var:player_level}(i)+{var:item_level}({var:player_relikt}(i)) : gosub {:gosub_validate_level}
		b={var:player_exp}(i)                                           : gosub {:gosub_validate_exp}
		print"{home}{white}"left$(cd$,5+i*3)"{right:3}lv ";d$;"   ex ";e$:goto{:battel_gewonnen_print_tx}

	{:battel_gewonnen_next}
		nexti
		goto{:battel_gewonnen_joyauswertung}
	{:battel_gewonnen_add_lv_exp}
		{var:player_level}(i)={var:player_level}(i)+1:{var:player_atk}(i)={var:player_atk}(i)+1:{var:player_def}(i)={var:player_def}(i)+1
		{var:player_speed}(i)={var:player_speed}(i)+1
		{var:player_hp_max}(i)={var:player_hp_max}(i)+{var:player_level}(i)*2:if{var:player_mp_max}(i)>0then{var:player_mp_max}(i)={var:player_mp_max}(i)+{var:player_level}(i)*3
		if {var:player_hp_max}(i)>999then {var:player_hp_max}(i)=999
		if {var:player_mp_max}(i)>999then {var:player_mp_max}(i)=999
		return
	{:battel_gewonnen_joyauswertung}
		gosub{:gosub_joywait_fire}
		goto{:mainloop}
{:goto_battel_verloren}
	'                               123456789a123456789b123456789c12345678
	print"{home}{down}{right}{white}du hast verloren                     "
	gosub{:gosub_joywait_fire}
	goto{:start}
'
'"""""""""""""""""""""""""""""""""""""""""""""""""
'gosub
'"""""""""""""""""""""""""""""""""""""""""""""""""
{:gosub_heilen}
		for i=0 to 3:if {var:player_activ}(i)=0 then{:heilen_next}
		{var:player_hp}(i) = {var:player_hp_max}(i)
		{var:player_mp}(i) = {var:player_mp_max}(i)
		{:heilen_next}
		next
	return
{:gosub_print_player_hp}
		print dd$;
		for i=0 to 3:if {var:player_activ}(i)=0 then printspc(40);:goto{:player_hp_next}
		print"{white}";:if {var:player_hp}(i)=0 then print"{red}";
		print spc(27){var:player_name}(i)" ";:a={var:player_hp}(i):gosub{:gosub_validate_hp_mp}
		print d$;
		a={var:player_mp}(i):gosub{:gosub_validate_hp_mp}
		print" "d$"{right}";
		{:player_hp_next}
		next
	return
{:gosub_menu_item}
	gosub{:gosub_sort_inventar}
	mi=-1:m=0:mo=0
	{:menu_item_pos}
		mi=mo-1:cy=my:mm=0
		if mc=4  then gosub {:menu_item_clear}
		if mc=14 then gosub {:menu_item_clear_big}
	{:menu_item_print}
		mi=mi+1
		'print pos menue
			print"{home}{white}"left$(cd$,cy)spc(mx)" ";
		'wenn item_ident <> menu transition
			if {var:item_ident}({var:inventar_slot}(mi))<>mt then print"{cyan}";
		'wenn item_ident 9=zurueck -1=leer
			if {var:item_ident}({var:inventar_slot}(mi))=9  then print"{white}";
			if {var:item_ident}({var:inventar_slot}(mi))=-1 then print"{cyan}";
		'print item

			'mt=0 waffe
			'mt=1 ruestung
			'mt=2 essbar
			'mt=3 magie
			'mt=4 equipment
			'mt=9 zurueck

			'ee=0 battel item / magic
			if ee=0 then print {var:item_name}({var:inventar_slot}(mi));

			'ee=1 mainloop equipment
			if ee=1 and {var:item_ident}({var:inventar_slot}(mi))=9 then print {var:item_name}({var:inventar_slot}(mi));
			if ee=1 and mt=0 and {var:item_ident}({var:inventar_slot}(mi))=0 then print {var:item_name}({var:inventar_slot}(mi)); " atk";{var:item_atk}({var:inventar_slot}(mi))
			if ee=1 and mt=1 and {var:item_ident}({var:inventar_slot}(mi))=1 then print {var:item_name}({var:inventar_slot}(mi)); " def";{var:item_def}({var:inventar_slot}(mi))
			if ee=1 and mt=4 and {var:item_ident}({var:inventar_slot}(mi))=4 then print {var:item_name}({var:inventar_slot}(mi)); " rel";{var:item_mana}({var:inventar_slot}(mi))
			
			'ee=2 mainloop inventar
			if ee=2 and {var:item_ident}({var:inventar_slot}(mi))=9 then print {var:item_name}({var:inventar_slot}(mi));
			if ee=2 and {var:item_name}({var:inventar_slot}(mi)) ="apfel   " and {var:item_ident}({var:inventar_slot}(mi))=2 then print {var:item_name}({var:inventar_slot}(mi)); "            hp ";{var:item_mana}({var:inventar_slot}(mi))
			if ee=2 and {var:item_name}({var:inventar_slot}(mi)) ="pilz    " and {var:item_ident}({var:inventar_slot}(mi))=2 then print {var:item_name}({var:inventar_slot}(mi)); "            mp ";{var:item_mana}({var:inventar_slot}(mi))
			if ee=2 and {var:item_ident}({var:inventar_slot}(mi))=0 then print {var:item_name}({var:inventar_slot}(mi)); "  waffe     atk";{var:item_atk}({var:inventar_slot}(mi));
			if ee=2 and {var:item_ident}({var:inventar_slot}(mi))=1 then print {var:item_name}({var:inventar_slot}(mi)); "  ruestung  def";{var:item_def}({var:inventar_slot}(mi));
			if ee=2 and {var:item_ident}({var:inventar_slot}(mi))=3 then print {var:item_name}({var:inventar_slot}(mi)); "  magie     mp ";{var:item_mana}({var:inventar_slot}(mi));
			if ee=2 and {var:item_ident}({var:inventar_slot}(mi))=4 then print {var:item_name}({var:inventar_slot}(mi)); "  relikt    rel";{var:item_mana}({var:inventar_slot}(mi));

		'current y
			cy=cy+1
		'mm=menu zaehler
			mm=mm+1
		'wenn menue zaehler = mc
			if mm=mc then{:menu_item_auswertung}
		'wenn menue zaehler < 13
			if mi<=49 then{:menu_item_print}
	{:menu_item_auswertung}
		cp={var:bildschirmspeicher}+mx+my*40
	{:menu_item_joyauswertung}
		'print cursor
			poke cp+(m-mo)*40,35
		'gosub joy
			gosub{:gosub_joy}
		'print leerzeichen
			poke cp+(m-mo)*40,32
		'joy auf/ab return
			if a$="w"then m=m-1:goto{:menu_item_auswertung_posmenu}
			if a$="s"then m=m+1:goto{:menu_item_auswertung_posmenu}
			if a$="fu" and ee=2 then ee=4 : return
			if a$="fd" and ee=1 then ee=4 : return
			if a$=chr$(13)then return
		goto{:menu_item_joyauswertung}
	{:menu_item_auswertung_posmenu}
		if m=-1 then m=49-1:mo=49-mc:goto{:menu_item_pos}
		if m=49 then m=0:mo=0:goto{:menu_item_pos}
		m%=0
	{:menu_item_auswertung_auf_ab}
		if m<mo then mo=mo-mc:m%=1:goto{:menu_item_auswertung_auf_ab}
		if m>=mo+mc then mo=mo+mc:m%=1
		if mo<0 then mo=0:m%=1
		if m%=1 then{:menu_item_pos}
		goto{:menu_item_joyauswertung}
	{:menu_item_clear}
		for i=0 to 3
			print"{home}{white}"left$(cd$,cy+i)spc(mx)" ";
			print"        ";
		next i
		return
	{:menu_item_clear_big}
		for i=0 to 13
			print"{home}{white}"left$(cd$,cy+i)spc(mx)" ";
			if ee=1 then print"               ";
			if ee=2 then print"                                    ";
		next i
		return
{:gosub_sort_inventar}

	'mt=0 waffe
	'mt=1 ruestung
	'mt=2 essbar
	'mt=3 magie
	'mt=4 equipment
	'mt=9 zurueck

	'clear temp
		a=0
		for i%=0 to 99 : {var:inventar_slottemp}(i%)=0 : next i%

	'copy inventar -> temp : del inventar
		for i%=0 to 99 : {var:inventar_slottemp}(i%)={var:inventar_slot}(i%): {var:inventar_slot}(i%)=0 : next i%

	'gosub mt
		if mt=0 then gosub {:mt=9} : gosub {:mt=0} : a=50 :gosub {:mt=1} : gosub {:mt=2} : gosub {:mt=3} : gosub {:mt=4}
		if mt=1 then gosub {:mt=9} : gosub {:mt=1} : a=50 :gosub {:mt=0} : gosub {:mt=2} : gosub {:mt=3} : gosub {:mt=4}
		if mt=3 then gosub {:mt=9} : gosub {:mt=3} : a=50 :gosub {:mt=0} : gosub {:mt=1} : gosub {:mt=2} : gosub {:mt=4}
		if mt=4 then gosub {:mt=9} : gosub {:mt=4} : a=50 :gosub {:mt=0} : gosub {:mt=1} : gosub {:mt=2} : gosub {:mt=3}

		'ee=0 battel item / magic
		if mt=2 and ee=0 then gosub {:mt=9} : gosub {:mt=2} : a=50 :gosub {:mt=0} : gosub {:mt=1} : gosub {:mt=3} : gosub {:mt=4}
		'ee=1 mainloop equipment
		if mt=2 and ee=1 then gosub {:mt=9} : gosub {:mt=2} : a=50 :gosub {:mt=0} : gosub {:mt=1} : gosub {:mt=3} : gosub {:mt=4}
		'ee=2 mainloop inventar
		if mt=2 and ee=2 then gosub {:mt=2} :gosub {:mt=0} : gosub {:mt=1} : gosub {:mt=4} : gosub {:mt=3}:a=50:gosub {:mt=9}

	return

	'copy temp -> inventar
	{:mt=9}
		for i%=0 to 99 : if {var:item_ident}({var:inventar_slottemp}(i%))=9 then {var:inventar_slot}(a)={var:inventar_slottemp}(i%) : a=a+1 : 'zurueck
		next i%
		return
	{:mt=0}
		for i%=0 to 99 : if {var:item_ident}({var:inventar_slottemp}(i%))=0 then {var:inventar_slot}(a)={var:inventar_slottemp}(i%) : a=a+1 : 'weapon
		next i%
		return
	{:mt=1}
		for i%=0 to 99 : if {var:item_ident}({var:inventar_slottemp}(i%))=1 then {var:inventar_slot}(a)={var:inventar_slottemp}(i%) : a=a+1 : 'ruestung
		next i%
		return
	{:mt=2}
		for i%=0 to 99 : if {var:item_ident}({var:inventar_slottemp}(i%))=2 then {var:inventar_slot}(a)={var:inventar_slottemp}(i%) : a=a+1 : 'essbar
		next i%
		return
	{:mt=3}
		for i%=0 to 99 : if {var:item_ident}({var:inventar_slottemp}(i%))=3 then {var:inventar_slot}(a)={var:inventar_slottemp}(i%) : a=a+1 : 'magic
		next i%
		return
	{:mt=4}
		for i%=0 to 99 : if {var:item_ident}({var:inventar_slottemp}(i%))=4 then {var:inventar_slot}(a)={var:inventar_slottemp}(i%) : a=a+1 : 'relikt
		next i%
		return
{:gosub_add_item_inventar}
	'set is
		is=0
	{:inventar_next}
	'wenn inventar leer
		if {var:inventar_slot}(is)=0 then {var:inventar_slot}(is)={var:nimm_item}:{var:nimm_item}=-1:return
	'next inventar
		is=is+1
	'wenn inventar max
		if is=99 then return
	goto{:inventar_next}

{:gosub_clear_map}
	print"{home}{down:3}{brown}";
	fori=0to15
	print"{$20:40}";:next
	return
{:gosub_clear_top}
	print"{home}{down}{right}{white}{$20:38}";
	return
{:gosub_equipment_rahmen}
	print"{brown}{home}{down:3}{$c1}{$c2:18}{$c3}{$c1}{$c2:18}{$c3}";
	fori=0to5
	print"{$c4}                  {$c5}{$c4}                  {$c5}";:next
	print"{$c6}{$c7:18}{$c8}{$c6}{$c7:18}{$c8}";
	print"{$c1}{$c2:18}{$c3}{$c1}{$c2:18}{$c3}";
	fori=0to5
	print"{$c4}                  {$c5}{$c4}                  {$c5}";:next
	print"{$c6}{$c7:18}{$c8}{$c6}{$c7:18}{$c8}";
	dx=3:dy=4:p=0:gosub{:gosub_equipment_print_atk_def}:dx=23:p=1:gosub{:gosub_equipment_print_atk_def}
	dx=3:dy=12:p=2:gosub{:gosub_equipment_print_atk_def}:dx=23:p=3:gosub{:gosub_equipment_print_atk_def}
	return
{:gosub_equipment_print_atk_def}
	if {var:player_activ}(p)=0 then return
	print"{home}{white}";:if{var:player_hp}(p)=0thenprint"{red}";
	print"{home}"left$(cd$,dy)spc(dx-1)" "{var:player_name}(p)"  lv"{var:player_level}(p)+{var:item_level}({var:player_relikt}(p))
	print"{home}{white}{down:2}"left$(cd$,dy)spc(dx)" "{var:item_name}({var:player_waffe}(p));
	print"{home}{white}{down:3}"left$(cd$,dy)spc(dx)" "{var:item_name}({var:player_ruestung}(p));
	print"{home}{white}{down:4}"left$(cd$,dy)spc(dx)" "{var:item_name}({var:player_relikt}(p));
	{var:val_atk}={var:player_atk}(p)+{var:item_atk}({var:player_waffe}(p))+{var:item_atk}({var:player_relikt}(p))
	{var:val_def}={var:player_def}(p)+{var:item_def}({var:player_ruestung}(p))+{var:item_def}({var:player_relikt}(p))
	if {var:val_atk} > 999 then {var:val_atk} = 999
	if {var:val_def} > 999 then {var:val_def} = 999
	print"{home}{white}{down:2}"left$(cd$,dy)spc(dx+9)"atk"{var:val_atk};
	print"{home}{white}{down:3}"left$(cd$,dy)spc(dx+9)"def"{var:val_def};
	print"{home}{white}{down:4}"left$(cd$,dy)spc(dx+9)"rel"{var:item_mana}({var:player_relikt}(p))
	return
{:gosub_print_map}
	'-> new
		if cr=0 then ze=0
		if cr=1 then ze=20
		if cr=2 then ze=40

		if cr=3 then ze=480
		if cr=4 then ze=480+20
		if cr=5 then ze=480+40

		if cr=6 then ze=960
		if cr=7 then ze=960+20
		if cr=8 then ze=960+40

		if cr=10 then ze=0
		if cr=11 then ze=20
		if cr=12 then ze=40

		if cr=13 then ze=480
		if cr=14 then ze=480+20
		if cr=15 then ze=480+40

		if cr=16 then ze=960
		if cr=17 then ze=960+20
		if cr=18 then ze=960+40

		sp={var:start_map}+ze

	'print down
		for i%=0 to 7
			print"{home}{down:3}"left$(cd$,i%*2);
			for j%=0 to 19
				print {var:map_tile}(peek(sp))"{up}";
				sp=sp+1
			next j%
		sp=sp+40
		next i%
	return

{:goto_newgame}
	'part 1 start variabeln
		for i=0 to 3:{var:player_exp}(i)=0:next
		{var:player_atk}(0)=5:{var:player_def}(0)=2:{var:player_atk}(1)=4:{var:player_def}(1)=3:{var:player_atk}(2)=1:{var:player_def}(2)=1:{var:player_atk}(3)=1:{var:player_def}(3)=1
		{var:player_speed}(0)=10:{var:player_speed}(1)=10:{var:player_speed}(2)=8:{var:player_speed}(3)=7
	'item 0-99 = 0
		for i=0 to 99:{var:inventar_slot}(i)=0:next
		{var:inventar_slot}(0)=99
	'print rahmen
		print"{white}{clear}{brown}{$c1}{$c2:38}{$c3}";
		fori=1to23:print"{$c4}"spc(38)"{$c5}";:next
		print"{$c6}{$c7:38}{up:3}";
		poke 50151,72:poke 56295,9 '50151 = letzte pos bidschirmspeicher 56295= letzte pos farbspeicher
	'raum und posx/y
		x=10:y=5:cr=3
	'player aktiv
		{var:player_activ}(0)=1:{var:player_activ}(1)=0:{var:player_activ}(2)=0:{var:player_activ}(3)=0
	'set player hp mp max
		{var:player_hp_max}(0)=15:{var:player_hp_max}(1)=17:{var:player_hp_max}(2)=9:{var:player_hp_max}(3)=9:{var:player_mp_max}(0)=7:{var:player_mp_max}(1)=7:{var:player_mp_max}(2)=7:{var:player_mp_max}(3)=23
	'set player hp mp usw
		fori=0to3:{var:player_hp}(i)={var:player_hp_max}(i):{var:player_mp}(i)={var:player_mp_max}(i):{var:player_exp}(i)=0:{var:player_waffe}(i)=0:{var:player_ruestung}(i)=0:{var:player_relikt}(i)=0:next
	'player weappon = item 1 ruestung= item 2
		'{var:player_waffe}(0)=1:{var:player_ruestung}(0)=2
	'poke mapspeicher
		gosub {:gosub_raumaktion_poke_mapspeicher}
	'print text
		{var:seq_select}="intro"
		poke 1020,{var:farbe_bl}
		gosub {:gosub_load_screen_seq}
		gosub {:gosub_print_txt_screen}
		'print"{clr}";fre(0)
		'stop
		'gosub {:gosub_joywait_fire}

		'magic
		{var:inventar_slot}(1) =4   'feuer
		{var:inventar_slot}(2) =5   'polar
		{var:inventar_slot}(3) =6   'groll
		{var:inventar_slot}(4) =7   'bombe
		{var:inventar_slot}(5) =12  'blind
		{var:inventar_slot}(6) =9   'heilen

		'relikt
		{var:inventar_slot}(7)=18   'level1
		{var:inventar_slot}(8)=21   'level2
		{var:inventar_slot}(9)=24   'level3
		{var:inventar_slot}(10)=19  'attack1
		{var:inventar_slot}(11)=22  'attack2
		{var:inventar_slot}(12)=25  'attack3
		{var:inventar_slot}(13)=20  'defence1
		{var:inventar_slot}(14)=23  'defence2
		{var:inventar_slot}(15)=26  'defence3
		{var:inventar_slot}(16)=27  'speed1
		{var:inventar_slot}(17)=28  'speed2
		{var:inventar_slot}(18)=29  'speed3

		'waffen ruestung
		{var:inventar_slot}(19)=14  'rock
		{var:inventar_slot}(20)=16  'weste
		{var:inventar_slot}(21)=17  'schild

		{var:inventar_slot}(22)=11  'flegel
		{var:inventar_slot}(23)=13  'speer
		{var:inventar_slot}(24)=15  'schwert

		{var:player_activ}(0)=1		
	goto{:mainloop}
'
'"""""""""""""""""""""""""""""""""""""""""""""""""
'sprite
'"""""""""""""""""""""""""""""""""""""""""""""""""
{:gosub_sprite_player}        'sprite 0
	'sprite
		poke {var:sprite_multicolor_1},8  : poke {var:sprite_multicolor_2},0  : poke {var:sprite_hirescolor},2
		poke {var:sprite_multi_on_off},{%:00000111}
		poke {var:sprite0_x},((x*2)*8+24) and 255         'sprite 0 posx
		poke {var:sprite0_y},(y*2)*8+50+24                'sprite 0 posy
		poke {var:sprite_x_highbit},-((x*2)>29)           'x highbit %00000011 sprite posx
		poke {var:sprite_register},{var:spritebank}+11    'datenzeiger sprite 0=11
		bi%={%:00000001}:gosub{:gosub_sprite_on}
	return
{:gosub_sprite_aurufezeichen} 'sprite 1
	'sprite
		poke {var:sprite_multicolor_1},8  : poke {var:sprite_multicolor_2},0  : poke {var:sprite_hirescolor}+1,1
		poke {var:sprite1_x},((x*2)*8+24) and 255        'sprite 1 posx
		poke {var:sprite1_y},((y*2)*8+50+24)-16          'sprite 1 posy (+24=map ist drei zeilen weiter unten)
		poke {var:sprite_x_highbit},-((x*2)>29)          'x highbit %00000000 sprite posx
		poke {var:sprite_register}+1,{var:spritebank}+12 'datenzeiger sprite 1 auf 12
		bi%={%:00000010}:gosub{:gosub_sprite_on}
	return
{:gosub_sprite_fragezeichen}  'sprite 1
	'sprite
		poke {var:sprite_multicolor_1},8  : poke {var:sprite_multicolor_2},0  : poke {var:sprite_hirescolor}+1,1
		poke {var:sprite1_x},((x*2)*8+24) and 255        'sprite 1 posx
		poke {var:sprite1_y},((y*2)*8+50+24)-16          'sprite 1 posy (+24=map ist drei zeilen weiter unten)
		poke {var:sprite_x_highbit},-((x*2)>29)          'x highbit %00000000 sprite posx
		poke {var:sprite_register}+1,{var:spritebank}+13 'datenzeiger sprite 1 auf 13
		bi%={%:00000010}:gosub{:gosub_sprite_on}
	return
{:gosub_sprite_apfel}         'sprite 2
	'sprite
		poke {var:sprite_multicolor_1},8  : poke {var:sprite_multicolor_2},0  : poke {var:sprite_hirescolor}+2,2
		poke {var:sprite2_x},((xe%*2)*8+24) and 255      'sprite 2 posx
		poke {var:sprite2_y},((ye%*2)*8+50+24)           'sprite 2 posy (+24=map ist drei zeilen weiter unten)
		poke {var:sprite_register}+2,{var:spritebank}+14 'datenzeiger sprite 2 auf 14
		bi%={%:00000100}:gosub{:gosub_sprite_on}
	return
{:gosub_sprite_pilz}          'sprite 2
	'sprite
		poke {var:sprite_multicolor_1},8  : poke {var:sprite_multicolor_2},0  : poke {var:sprite_hirescolor}+2,2
		poke {var:sprite2_x},((xe%*2)*8+24) and 255      'sprite 2 posx
		poke {var:sprite2_y},((ye%*2)*8+50+24)           'sprite 2 posy (+24=map ist drei zeilen weiter unten)
		poke {var:sprite_register}+2,{var:spritebank}+15 'datenzeiger sprite 2 auf 15
		bi%={%:00000100}:gosub{:gosub_sprite_on}
	return
{:gosub_sprite_on}
	poke {var:sprite_on_off},peek({var:sprite_on_off}) or bi%
	'-> player sprite off direkt poke {%:00000000}
	return
{:gosub_sprite_off}
	poke {var:sprite_on_off},peek({var:sprite_on_off}) and {%:11111111}-bi%
	'-> player sprite off direkt poke {%:00000000}
	return
'
'"""""""""""""""""""""""""""""""""""""""""""""""""
'rahmen
'"""""""""""""""""""""""""""""""""""""""""""""""""
{:gosub_print_rahmen_oben}
	'rahmen oben
		print"{brown}{home}{$c1}{$c2:38}{$c3}";
		print"{$c4}                                      {$c5}";
		print"{$c6}{$c7:38}{$c8}"
	return
{:gosub_print_rahmen_unten_battel}
	'hp/mp wird nicht geloescht
		print dd$;"{brown}{up}{$c1}{$c2:7}{white}hp{brown}{$c2:1}{$c3}{$c1}{$c2:12}{$c3}{$c1}{$c2:5}{white}hp{brown}{$c2:2}{white}mp{brown}{$c2}{$c3}";		
		for i=0 to 3:print"{$c4}{$20:10}{$c5}{$c4}{$20:12}{$c5}{$c4}{right:12}{$c5}";:next
		print"{$c6}{$c7:10}{$c8}{$c6}{$c7:12}{$c8}{$c6}{$c7:12}";
		poke 50151,72:poke 56295,9
	return
{:gosub_print_rahmen_unten_map}
	'hp/mp wird nicht geloescht
		print dd$;"{brown}{up}{$c1}{$c2:12}{$c2:12}{$c3}{$c1}{$c2:5}{white}hp{brown}{$c2:2}{white}mp{brown}{$c2}{$c3}";
		for i=0 to 3:print"{$c4}{$20:12}{$20:12}{$c5}{$c4}{right:12}{$c5}";:next
		print"{$c6}{$c7:12}{$c7:12}{$c8}{$c6}{$c7:12}";
		poke 50151,72:poke 56295,9
	return
{:gosub_print_rahmen_unten_txt}
		print dd$;"{brown}{up}{$c1}{$c2:38}{$c3}";		
		for i=0 to 3:print"{$c4}                                      {$c5}";:next
		print"{$c6}{$c7:12}{$c7:12}{$c7:2}{$c7:12}";
		poke 50151,72:poke 56295,9
	return
{:gosub_print_rahmen_unten_cyan}
		print dd$;"{dk. gray}{up}{$c1}{$c2:38}{$c3}";		
		for i=0 to 3:print"{$c4}                                      {$c5}";:next
		print"{$c6}{$c7:12}{$c7:12}{$c7:2}{$c7:12}";
		poke 50151,72:poke 56295,11
	return
{:gosub_print_rahmen_mitte}
	print"{brown}{home}{down:3}{$c1}{$c2:38}{$c3}";
	fori=0to13
	print"{$c4}                                      {$c5}";:next
	print"{$c6}{$c7:38}{$c8}";:return
'
'"""""""""""""""""""""""""""""""""""""""""""""""""
'txt
'"""""""""""""""""""""""""""""""""""""""""""""""""
{:gosub_print_info_txt}
	gosub {:gosub_clear_info_txt}
	print dd$;"{right}";va$
	return
{:gosub_clear_info_txt}
	printdd$;"{right}{white}{$20:24}";
	return
{:gousb_print_black_seq}
	'-> sprite off
	gosub{:gosub_clear_top}
	poke {var:sprite_on_off},{%:00000000}
	print"{brown}{home}{down:3}";
	fori=0to15
	print"{rvrs on}{brown}{33}{rvrs off}{orange}{215:38}{rvrs on}{brown}{35}{white}{rvrs off}";:next
	return
{:gosub_load_game_seq}
	poke 56322,224 : 'tastatur 224=aus 225=an
	if {var:seq_select}="nibelheim" then open 1,8,4,"txt.nibelheim,s,r"
	if {var:seq_select}=""          then return
	for i= 0 to 99 : sb$(i)="":next i
	i=0	
	{:input_game_seq}
		input#1,sb$(i)
		'st=0 status floppy lesen
		if st=0 then i=i+1: goto{:input_game_seq}
		close 1:poke 56322,255
	return
{:gosub_load_screen_seq}
	poke 56322,224 : 'tastatur 224=aus 225=an
	if {var:seq_select}="intro"     then open 1,8,4,"txt.intro,s,r"	
	if {var:seq_select}=""          then return
	
	for i=0 to 5 : si$(i)="":next i
	i=0
	{:input_screen_seq}
		input#1,si$(i)
		'st=0 status floppy lesen
		if st=0 then i=i+1: goto{:input_screen_seq}
		close 1:poke 56322,255
	return
{:gosub_print_txt_screen}
	'infotext blau
		print"{home}{right:2}{down:2}{white}"  ;si$(0);
		print"{home}{right:2}{down:4}{white}"  ;si$(1);
		print"{home}{right:2}{down:6}{white}"  ;si$(2);
		print"{home}{right:2}{down:8}{white}"  ;si$(3);
		print"{home}{right:2}{down:10}{white}" ;si$(4);
		print"{home}{right:2}{down:12}{white}" ;si$(5);	
		gosub{:gosub_joywait_fire}
		return
{:gosub_print_txt_game}	
	'
	'text nacho
		gosub{:gosub_print_rahmen_unten_txt}
		if pt=1 and ma=3 then print"{home}{right:2}{down:19}{white}"  ;{var:monster_name}(ma);":"
		if pt=1 and ma=3 then print"{home}{right:2}{down:20}{cyan}<"  ;sb$(0);
		if pt=1 and ma=3 then print"{home}{right:2}{down:21}{cyan}"   ;sb$(1);
		if pt=1 and ma=3 then print"{home}{right:2}{down:22}{cyan}"   ;sb$(2);">"
		if pt=1 and ma=3 then gosub{:gosub_joywait_fire}
	'
	'text kron
		if pt=1 and ma=3 then gosub{:gosub_print_rahmen_unten_cyan}
		if pt=1 and ma=3 then print"{home}{right:2}{down:19}{cyan}"   ;{var:player_name}(pa);":"
		if pt=1 and ma=3 then print"{home}{right:2}{down:20}{white}<" ;sb$(3);
		if pt=1 and ma=3 then print"{home}{right:2}{down:21}{white}"  ;sb$(4);
		if pt=1 and ma=3 then print"{home}{right:2}{down:22}{white}"  ;sb$(5);">"
		if pt=1 and ma=3 then gosub{:gosub_joywait_fire}
		if pt=1 and ma=3 then gosub{:gosub_print_rahmen_unten_cyan}
		if pt=1 and ma=3 then print"{home}{right:2}{down:19}{cyan}"   ;{var:player_name}(pa);":"
		if pt=1 and ma=3 then print"{home}{right:2}{down:20}{white}"  ;sb$(6);:sy=20:sx=11:ss=3		
		if pt=1 and ma=3 then gosub{:gosub_print_txt_screen_choose}		


	'
	'text lena
		if pt=1 and pa=1 then print"{home}{right:2}{down:19}{white}"  ;{var:player_name}(pa);":"
		if pt=1 and pa=1 then print"{home}{right:2}{down:20}{cyan}<"  ;sb$(7);
		if pt=1 and pa=1 then print"{home}{right:2}{down:21}{cyan}"   ;sb$(8);">"
		if pt=1 and pa=1 then gosub{:gosub_joywait_fire}
	

		gosub{:gosub_print_rahmen_unten_txt}
		gosub{:gosub_print_rahmen_unten_map}
		gosub{:gosub_print_player_hp}
		pt=0:pa=0:ma=0
		return

{:gosub_print_txt_screen_choose}
	ch=1:a$=""
	va$=""
	'bildschirmspeicher (pro zeile 40 zeichen 0-39)
	py=(sy*40)
	px=sx
	poke {var:bildschirmspeicher}+py+px,35 : 'print cursor
	{:joy_choose}
		jm%=0:gosub{:gosub_joy}
		if a$="a" then ch=1 : poke {var:bildschirmspeicher}+py+px+ss,32 :poke {var:bildschirmspeicher}+py+px,35
		if a$="d" then ch=0 : poke {var:bildschirmspeicher}+py+px,32    :poke {var:bildschirmspeicher}+py+px+ss,35
		if a$=chr$(13) and ch=1 then return
		if a$=chr$(13) and ch=0 then return
	goto{:joy_choose}
{:gosub_load_map}
	poke {var:sprite_on_off},{%:00000000} 
	poke 1020,{var:farbe_bl}	
	gosub{:gosub_clear_top}
	gosub{:gosub_clear_map}	
	print"{home}{down:10}{right:16}{white}loading..."
	print"{home}{right:2}{down:3}{blue}" 

	sys (57812)ml$,8,0:poke 780,0:poke 781,{$:00}:poke 782,{$:c4}:sys 65493

	if ml$="map0" then {var:seq_select}="nibelheim"
	if ml$="map1" then {var:seq_select}="map1"
	gosub{:gosub_load_game_seq}	
	gosub{:gosub_clear_map} 
	return
'
'"""""""""""""""""""""""""""""""""""""""""""""""""
'validate
'"""""""""""""""""""""""""""""""""""""""""""""""""
{:gosub_validate_hp_mp}
	t$=str$(a)
	d$=right$("000"+right$(t$,len(t$)-1),3):return
{:gosub_validate_damage}
	if ap > 99 then ap=99
	da$=str$(ap)
	ap$=right$("00"+right$(da$,len(da$)-1),2):return
{:gosub_validate_level}
	if a > 99 then a=99
	t$=str$(a)
	d$=right$("00"+right$(t$,len(t$)-1),2):return
{:gosub_validate_exp}
	if b > 9999 then b=9999
	t$=str$(b)
	e$=right$("0000"+right$(t$,len(t$)-1),4):return
' 
'"""""""""""""""""""""""""""""""""""""""""""""""""
'joy
'"""""""""""""""""""""""""""""""""""""""""""""""""
{:gosub_joy}
	a$="" : b$=""
	{:joy_wait}
		j=peek(56320)			
		'jump wenn joymap=1 und kein fire (jm%=1 auf der map)
		if jm%=1 and j<>111 and j<>107 and j<>103 and j<>110 and j<>109 then {:joy}
		'jump wenn keine bewegung
		if j=127 then {:joy}
		'jump wenn fire+left/right/up/down
		if j=107 or j=103 or j=110 or j=109 then {:joy}
		goto {:joy_wait}
	{:joy}
		j=peek(56320)		
		'tastatur
			get b$
			if b$=chr$(133) then a$="fu"  : return 'fire+up      (f1)
			if b$=chr$(134) then a$="fd"  : return 'fire+down    (f3)
			if b$=chr$(135) then a$="fl"  : return 'fire+left    (f5)
			if b$=chr$(136) then a$="fr"  : return 'fire+right   (f7)
			if b$="a" then a$="a"  : return
			if b$="d" then a$="d"  : return
			if b$="w" then a$="w"  : return
			if b$="s" then a$="s"  : return
			if b$=chr$(13) then a$=chr$(13) :return
		'warten fire und keine bewegung return
			if j=127 and a$=chr$(13) then return
		'fire und links,rechts,oben oder unten
			if j=107 then a$="fl"  : return 'fire+left
			if j=103 then a$="fr"  : return 'fire+right
			if j=110 then a$="fu"  : return 'fire+up
			if j=109 then a$="fd"  : return 'fire+down
		'links,rechts,oben oder unten
			if j=123 then a$="a"   : return
			if j=119 then a$="d"   : return
			if j=126 then a$="w"   : return
			if j=125 then a$="s"   : return
		'fire
			if j=111 then a$=chr$(13)
		goto {:joy}
{:gosub_joywait_fire}
	a$="" : b$=""
	{:joywait_fire}
	j=peek(56320)
	'tastatur
		get b$
		if b$=chr$(13) then a$=chr$(13):return
	'warten fire und keine bewegung
		if j=127 and a$=chr$(13) then return
	'fire
		if j=111 then a$=chr$(13)
	goto {:joywait_fire}
' 
'"""""""""""""""""""""""""""""""""""""""""""""""""
'delay
'"""""""""""""""""""""""""""""""""""""""""""""""""
{:gosub_delay_fight}
	poke 162,0: wait 162,32:return
{:gosub_delay_sprite}
	poke 162,0: wait 162,2 :return
{:gosub_delay_sprite_animation}
	poke 162,0: wait 162,16 :return
{:gosub_delay_text}
	poke 162,0: wait 162,32
	poke 162,0: wait 162,32
	poke 162,0: wait 162,32
	poke 162,0: wait 162,32
	return
' 
'"""""""""""""""""""""""""""""""""""""""""""""""""
'data
'"""""""""""""""""""""""""""""""""""""""""""""""""
'monster
	'{var:monster_xxx}(x)
	'    name     hp   mp   lv    atk   def  spe    exp
	data"imp",    5   ,0   ,8    ,4    ,1    ,8     ,3
	data"snake",  8   ,0   ,12   ,6    ,1    ,12    ,5
	data"viper",  12  ,0   ,18   ,6    ,1    ,18    ,9
	data"nacho",  30  ,0   ,22   ,15   ,5    ,22    ,50
	data"golem",  20  ,0   ,4    ,20   ,8    ,4     ,17
	data"moss" ,  30  ,0   ,7    ,26   ,9    ,7     ,21
	data"bones",  50  ,0   ,20   ,18   ,8    ,20    ,15
	data"wisp" ,  25  ,50  ,15   ,0    ,8    ,15    ,17
	data"troll",  100 ,0   ,9    ,40   ,13   ,9     ,100
	data"spark",  30  ,50  ,22   ,0    ,8    ,22    ,17
	data"burny",  80  ,90  ,30   ,25   ,13   ,30    ,42
	data"tbery",  120 ,10  ,60   ,60   ,20   ,60    ,150
	data"dracu",  250 ,60  ,50   ,70   ,25   ,50    ,500
	data"glado",  500 ,70  ,60   ,80   ,30   ,60    ,1000
'player
	'{var:player_xxx}(x)
	'    name     hp   mp   lv    atk   def  spe   waffe  ruestung
	data"kron",   15  ,7   ,1    ,4    ,3    ,10   ,0     ,0
	data"lena",   17  ,7   ,1    ,3    ,3    ,10   ,0     ,0
	data"dolm",   9   ,7   ,1    ,1    ,1    ,8    ,0     ,0
	data"mira",   9   ,23  ,1    ,1    ,1    ,7    ,0     ,0

'items
	'{var:item_ident}(0-18) 0 = weappon
	'{var:item_ident}(0-18) 1 = ruestung
	'{var:item_ident}(0-18) 2 = essbar
	'{var:item_ident}(0-18) 3 = magie
	'{var:item_ident}(0-18) 4 = relikt
	'{var:item_ident}(0-18) 9 = zurueck
	'{var:item_xxx}(x)
	'     name      at de lv sp,ma id
	data "        ",00,00,00,00,00,-1  :'item 0
	data "dolch   ",03,00,00,00,00,00  :'item 1 kron
	data "helm    ",00,02,-1,00,00,01  :'item 2 kron
	data "pilz    ",00,00,-1,00,10,02  :'item 3 {var:event_item}(x)
	data "feuer   ",00,00,00,00,05,03  :'item 4 {var:event_item}(x)
	data "polar   ",00,00,00,00,08,03  :'item 5 {var:event_item}(x)
	data "groll   ",00,00,00,00,23,03  :'item 6 
	data "bombe   ",00,00,00,00,50,03  :'item 7 {var:event_item}(x)
	data "apfel   ",00,00,-1,00,15,02  :'item 8 {var:event_item}(x)
	data "heilen  ",00,00,00,00,04,03  :'item 9 {var:event_item}(x)
	data "scull   ",00,00,00,00,00,04  :'item 10
	data "flegel  ",07,00,-1,00,00,00  :'item 11 {var:event_item}(x)
	data "blind   ",00,00,00,00,04,03  :'item 12
	data "speer   ",12,00,00,00,00,00  :'item 13 {var:event_item}(x)
	data "rock    ",00,10,00,00,00,01  :'item 14
	data "schwert ",23,00,00,00,00,00  :'item 15 {var:event_item}(x)
	data "weste   ",00,14,00,00,00,01  :'item 16 {var:event_item}(x)
	data "schild  ",00,24,00,00,00,01  :'item 17 {var:event_item}(x)
	data "level   ",00,00,05,00,05,04  :'item 18
	data "attack  ",05,00,00,00,05,04  :'item 19
	data "defence ",00,05,00,00,05,04  :'item 20
	data "level   ",00,00,10,00,10,04  :'item 21
	data "attack  ",10,00,00,00,10,04  :'item 22
	data "defence ",00,10,00,00,10,04  :'item 23
	data "level   ",00,00,15,00,15,04  :'item 24
	data "attack  ",15,00,00,00,15,04  :'item 25
	data "defence ",00,15,00,00,15,04  :'item 26
	data "schnell ",00,00,00,05,05,04  :'item 27
	data "schnell ",00,00,00,10,10,04  :'item 28
	data "schnell ",00,00,00,15,15,04  :'item 29
	data "        ",00,00,00,00,00,-1  :'item 30
	data "        ",00,00,00,00,00,-1  :'item 31
	data "        ",00,00,00,00,00,-1  :'item 32
	data "        ",00,00,00,00,00,-1  :'item 33
	data "        ",00,00,00,00,00,-1  :'item 34
	data "        ",00,00,00,00,00,-1  :'item 35
	data "        ",00,00,00,00,00,-1  :'item 36
	data "        ",00,00,00,00,00,-1  :'item 37
	data "        ",00,00,00,00,00,-1  :'item 38
	data "        ",00,00,00,00,00,-1  :'item 39
	data "        ",00,00,00,00,00,-1  :'item 40
	data "        ",00,00,00,00,00,-1  :'item 41
	data "        ",00,00,00,00,00,-1  :'item 42
	data "        ",00,00,00,00,00,-1  :'item 43
	data "        ",00,00,00,00,00,-1  :'item 44
	data "        ",00,00,00,00,00,-1  :'item 45
	data "        ",00,00,00,00,00,-1  :'item 46
	data "        ",00,00,00,00,00,-1  :'item 47
	data "        ",00,00,00,00,00,-1  :'item 48
	data "        ",00,00,00,00,00,-1  :'item 49
	data "        ",00,00,00,00,00,-1  :'item 50
	data "        ",00,00,00,00,00,-1  :'item 51
	data "        ",00,00,00,00,00,-1  :'item 52
	data "        ",00,00,00,00,00,-1  :'item 53
	data "        ",00,00,00,00,00,-1  :'item 54
	data "        ",00,00,00,00,00,-1  :'item 55
	data "        ",00,00,00,00,00,-1  :'item 56
	data "        ",00,00,00,00,00,-1  :'item 57
	data "        ",00,00,00,00,00,-1  :'item 58
	data "        ",00,00,00,00,00,-1  :'item 59
	data "        ",00,00,00,00,00,-1  :'item 60
	data "        ",00,00,00,00,00,-1  :'item 61
	data "        ",00,00,00,00,00,-1  :'item 62
	data "        ",00,00,00,00,00,-1  :'item 63
	data "        ",00,00,00,00,00,-1  :'item 64
	data "        ",00,00,00,00,00,-1  :'item 65
	data "        ",00,00,00,00,00,-1  :'item 66
	data "        ",00,00,00,00,00,-1  :'item 67
	data "        ",00,00,00,00,00,-1  :'item 68
	data "        ",00,00,00,00,00,-1  :'item 69
	data "        ",00,00,00,00,00,-1  :'item 70
	data "        ",00,00,00,00,00,-1  :'item 71
	data "        ",00,00,00,00,00,-1  :'item 72
	data "        ",00,00,00,00,00,-1  :'item 73
	data "        ",00,00,00,00,00,-1  :'item 74
	data "        ",00,00,00,00,00,-1  :'item 75
	data "        ",00,00,00,00,00,-1  :'item 76
	data "        ",00,00,00,00,00,-1  :'item 77
	data "        ",00,00,00,00,00,-1  :'item 78
	data "        ",00,00,00,00,00,-1  :'item 79
	data "        ",00,00,00,00,00,-1  :'item 80
	data "        ",00,00,00,00,00,-1  :'item 81
	data "        ",00,00,00,00,00,-1  :'item 82
	data "        ",00,00,00,00,00,-1  :'item 83
	data "        ",00,00,00,00,00,-1  :'item 84
	data "        ",00,00,00,00,00,-1  :'item 85
	data "        ",00,00,00,00,00,-1  :'item 86
	data "        ",00,00,00,00,00,-1  :'item 87
	data "        ",00,00,00,00,00,-1  :'item 88
	data "        ",00,00,00,00,00,-1  :'item 89
	data "        ",00,00,00,00,00,-1  :'item 90
	data "        ",00,00,00,00,00,-1  :'item 91
	data "        ",00,00,00,00,00,-1  :'item 92
	data "        ",00,00,00,00,00,-1  :'item 93
	data "        ",00,00,00,00,00,-1  :'item 94
	data "        ",00,00,00,00,00,-1  :'item 95
	data "        ",00,00,00,00,00,-1  :'item 96
	data "        ",00,00,00,00,00,-1  :'item 97
	data "        ",00,00,00,00,00,-1  :'item 98
	data "zurueck ",00,00,00,00,00,09  :'item 99
'
'"""""""""""""""""""""""""""""""""""""""""""""""""
'tile
'"""""""""""""""""""""""""""""""""""""""""""""""""
