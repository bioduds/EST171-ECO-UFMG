
S = 3000
N = 100

print( paste( "Simulacoes:", S ) )
print( paste( "Tamanho do Album:", N ) )

allDraws = c()

for( i in 1:S ) {
    #print( paste( "Simulação", i ) )
    draws = 0
    album = c()
    while( length( album ) < N ) {
        draws <- draws + 1
        r1 <- sample( 1:N, 1 )
        album <- append( album, r1 )
        album <- unique( album );
    }
    allDraws <- append( allDraws, draws )
}
print( paste( "Numero de Compras de pacotes com uma figurinha:", round( mean( allDraws ) ) ) )
print( paste( "Valor Esperado:", round( ( N * log( N ) ) ) ) )

