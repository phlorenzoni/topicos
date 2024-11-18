module statistical_tools
    use, intrinsic :: iso_fortran_env, only: sp => real32, dp => real64, i4 => int32, i8 => int64
    implicit none


    contains

    ! Função para calcular média
    function media(Ndados,vetor_dados) result(valor_media)
    
        implicit none
    
    integer(i8), intent(in) :: Ndados ! Quantidade de dados
    real(dp), intent(in) :: vetor_dados(Ndados) ! Vetor de dados
    real(dp) :: valor_media ! Resultado
     
    ! Soma dos dados dividido por Ndados
    valor_media = sum(vetor_dados, dim = 1) / (1.0_dp*Ndados)
    
    end function

    function variancia(Ndados, vetor_dados) result (var)
        
        implicit none
    
    integer(i8), intent(in):: Ndados ! Quantidade de dados
    real(dp), intent(in) :: vetor_dados(Ndados) ! Vetor de dados
    real (dp) valor_media, soma_desvios, var
    integer :: i,j,k ! Auxiliares
    
    ! Chamando a função anterior para calcular a media
    valor_media = media(Ndados,vetor_dados)
    soma_desvios = 0.0_dp
    
    do i = 1, Ndados
        soma_desvios = soma_desvios + (vetor_dados(i) - valor_media)**2
    enddo
    
    ! Dividindo pelo número de dados
    soma_desvios = soma_desvios/(1.0_dp*Ndados)
    var = soma_desvios
end function

function desvio_padrao(var) result (desvio)
    
    implicit none
real(dp) :: var, desvio

! Desvio é a raiz da variância
desvio = var**(0.5_dp)

end function

end module statistical_tools
