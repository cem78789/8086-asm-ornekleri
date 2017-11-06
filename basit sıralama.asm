
myss	segment para stack 'stack'
		dw 20 dup(?)
myss	ends       

myds	segment para 'data'
    sayi1	dw 007Eh  
    sayi2   dw 20 dup(0)
myds	ends     

mycs	segment para 'code'
		assume cs:mycs,ss:myss, ds:myds
main 	proc far 
        push ds
        mov ax,myds
        mov ds,ax
        xor ax,ax
        xor cx,cx
        mov ax,sayi1
        mov cx,sayi1
        sub cx,1
       
        lea di,sayi2 
        xor dx,dx  

     l3:xor cx,cx
        add ax,1
        adc dx,0
        xor cx,cx
        mov ax,cx
             
     l1:xor dx,dx
        xor ax,ax  
        mov ax,sayi1   
        
        div cx
        cmp dx,0
        jnz l2
        jmp l3         
        
     l2:loop l1
        
		ret 
main 	endp
mycs	ends
		end main 
		
			
