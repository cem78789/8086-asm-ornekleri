
myss	segment para stack 'stack'
		dw 20 dup(?)
myss	ends       

myds	segment para 'data'
    sayiw1	db 0ffh,021h,0ffh,0f7h,0ffh,021h,0ffh,0f7h,0ffh,021h,0ffh,0f7h
    sayiw2 	db 0ffh,021h,0ffh,0f7h,0ffh,021h,0ffh,0f7h,0ffh,021h,0ffh,0f7h   
    toplam  db 20 dup(0)
    uzunluk db 12
myds	ends     

mycs	segment para 'code'
		assume cs:mycs,ss:myss, ds:myds
main 	proc far 
        push ds
        mov ax,myds
        mov ds,ax
        xor ax,ax
        xor cx,cx
        mov cl,uzunluk 
        xor di,di
     l1:   
        mov al,sayiw1[di]
        mov bl,sayiw2[di]
        add al,bl 
        adc toplam[di+1],0 
           
        add toplam[di],al 
        inc di   
                           
        
        loop l1
        
		ret 
main 	endp
mycs	ends
		end main 
		
			