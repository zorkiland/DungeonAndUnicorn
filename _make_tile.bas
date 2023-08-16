ml$="tile"      : sys (57812)ml$,8,1:poke 780,0:poke 781,{$:00}:poke 782,{$:c4}:sys 65493
ml$="tilecolor" : sys (57812)ml$,8,1:poke 780,0:poke 781,{$:00}:poke 782,{$:c4}:sys 65493

open 15,8,15,"s:datatile":close 15
open 1,8,2,"datatile,s,w"

'anzahl tile
for j=0 to 111
    z=0

    'anzahl daten tile
    for i = 0 to 3       
        a=peek({$:c800}+i+(j*4))
        b=peek({$:ca00}+j)

               
        if a  < 128 then c$="[rvrs off]"
        if a  >=128 then c$="[rvrs on]"  

        'if (a>=0   and a<=31)  then  a=a+64
        'if (a>=32  and a<=63)  then  a=a+0
        if (a>=64  and a<=95)  then  a=a+128 : goto {:next}
        if (a>=96  and a<=127) then  a=a+64  : goto {:next}
        if (a>=128 and a<=159) then  a=a-64  : goto {:next}
        if (a>=160 and a<=191) then  a=a-128 : goto {:next}
        'if (a>=192 and a<=254) then  a=a+0
        'if (a=255)             then  a=a-64

    {:next}

        if b=0  then b$="[black]"
        if b=1  then b$="[white]"
        if b=2  then b$="[red]"
        if b=3  then b$="[cyan]"
        if b=4  then b$="[purple]"
        if b=5  then b$="[green]"
        if b=6  then b$="[blue]"
        if b=7  then b$="[yellow]"
        if b=8  then b$="[orange]"
        if b=9  then b$="[brown]"
        if b=10 then b$="[lt. red]"
        if b=11 then b$="[gray1]"
        if b=12 then b$="[gray2]"
        if b=13 then b$="[lt. green]"
        if b=14 then b$="[lt. blue]"
        if b=15 then b$="[gray3]"

        a$=str$(a)    
        ap$=right$(right$(a$,len(a$)-1),len(a$)-1)  
       

        if z=0 then p1$=b$ + c$ + "[" + ap$ + "]"
        if z=1 then p2$=c$ + b$ + "[" + ap$ + "]"
        if z=2 then p3$=c$ + b$ + "[" + ap$ + "]"
        if z=3 then p4$=c$ + b$ + "[" + ap$ + "]"

        z=z+1   
      
    next i 

        mo$="[down][left:2]"
        pa$= "data!"+p1$ + p2$ +mo$ +p3$ +p4$ + "[rvrs off]!"
        print#1,pa$
 
next j

close 1