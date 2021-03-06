! This program is a test for the Least Square Method at the polynomial case.
! Here it is made the calculation of the constants ai
! of a polynomial function of any degree that should minimize the error resulting from the adjustment.

program program_polynomial
use min_quadrados
use lu

implicit none
integer:: p, n, i, j, k
real, allocatable:: x(:), y(:), a(:,:), ata(:,:),f(:), c(:), L(:,:)

write(*,*) 'read p'
read(*,*) p
write(*,*) 'read n'
read(*,*) n   
       
allocate (x(n), y(n), a(n,p+1), ata(p+1,p+1), f(p+1), c(p+1), L(p+1,p+1))      
OPEN (file = 'points_values.dat', unit = 10, action = 'read', status = 'old')

read(10,*) (x(i), y(i), i= 1, n)
 close(10) 
     
CALL a_array(p,n,x,a)
CALL ata_array(p,n,y,f,a,ata)
CALL sub1_decomp (p,ata,L)
CALL sub2_solve(p,ata,L,f,c)

OPEN (unit = 20, file = 'a_values.dat', action = 'write', status = 'replace')   
          
do j= 1, p+1
	write(20,*) c(j)
end do

end program

