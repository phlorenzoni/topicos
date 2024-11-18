program atividade_1
    use, intrinsic :: iso_fortran_env, only: sp => real32, dp => real64, i4 => int32, i8 => int64
    use statistical_tools
    implicit none
    integer(i8), parameter :: Ndados = 60
    real(dp) :: x(Ndados),y(Ndados), media_, var_,des 
    real(dp), allocatable :: media_mov(:)
    character (len=100) :: fname
    integer(i8) :: delta_L ! Largura
    
    fname='corrente.dat'
    call leitura_dados(Ndados,x,y,fname)


    
    media_= media(Ndados, y)
    var_=variancia(Ndados,y)
    des = desvio_padrao(var_)

   write(*,'(A,2x,f5.3)') "Media:", media_
   write(*,'(A,2x,f5.3)') "Variancia:", var_
   write(*,'(A,2x,f5.3)') "Desvio padrao", des
   
   ! Largura da janela
   delta_L = 3_i8
   call media_movel(Ndados,y, delta_L)


contains
subroutine leitura_dados(Ndados, x, y, nome_arq)
!Vetores que receberão os dados dos eixos x e y
integer(i8) :: Ndados
real(dp) :: x (Ndados), y(Ndados)
integer :: arquivo, i 
character(len=100) :: nome_arq

! Abre o arquivo
open(unit=arquivo, file=fname)
! Faz a leitura
do i = 1, Ndados
    read(arquivo, *) x(i), y(i)
enddo

! Fecha o arquivo
close(arquivo)

endsubroutine
end program
