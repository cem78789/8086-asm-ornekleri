
myss	segment para stack 'stack'
		dw 20 dup(?)
myss	ends       

myds	segment para 'data'
    str1 db 'KEKAA','$'  
    strlen1 dw 5 
    toplam  db 20 dup(0)
    uzunluk db 2
myds	ends     

mycs	segment para 'code'
		assume cs:mycs,ss:myss, ds:myds
main 	proc far 
        push ds
        mov ax,myds
        mov ds,ax   
        
        xor ax,ax
        xor cx,cx  
        
        mov cx,strlen1
        shr cx,1   
           
        lea di,str1
     l1:             
        mov bx,cx
        sub bx,1    
        mov al,[bx+di]
        push ax
        
        mov ax,5
        sub ax,cx
        mov bx,ax
        pop ax
        
        cmp al,[bx+di]
        jne l2
        sub [uzunluk],1
        
        
        loop l1

     l2:mov al,[uzunluk]
        cmp al,0
        jne l3
        xor ax,ax 
	 l3:ret 
main 	endp
mycs	ends
		end main 
		
			