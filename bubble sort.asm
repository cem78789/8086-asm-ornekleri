
myss	segment para stack 'stack'
		dw 20 dup(?)
myss	ends       

myds	segment para 'data'
    sayi1	db 01001101b  
    sayi2   dw 20 dup(0)
myds	ends     

mycs	segment para 'code'
		assume cs:mycs,ss:myss, ds:myds
main 	proc far 
        push ds
        mov ax,myds
        xor ax,ax
        
        mov al,01001101b
        mov cx,8
        
     l1:
        mov al,sayi1
        shr al,1
        mov sayi1,al    
        
        loop l1
        
		ret 
main 	endp
mycs	ends
		end main 
		
			