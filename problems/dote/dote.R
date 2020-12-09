
S = 1
N = 10

for( i in 1:S ) {
    print( paste( "Simulação:", i ) )

    dotes = sample( 1:1000000, 10, replace = TRUE ) # maximo um milhao de dote
    print( dotes )
    print( sort( dotes ) )


    for( k in 1:N ) {
        exames = c()
        avaliacoes = c()
        for( ks in 1:k ) {
            exames <- append( exames, dotes[ks] )
        }
        for( ak in (k+1):N ) {
            avaliacoes <- append( avaliacoes, dotes[ak] )
        }

        print( "Exames" )
        print( exames )
        print( "Avaliações" )
        print( avaliacoes )

        for( b in 1:length( avaliacoes ) ) {
            comp <- avaliacoes >= exames
            # print( "Comparações" )
            # print( comp )

            if( comp ) {
                print( "Achei" )
                print( avaliacoes[b] )
                break
            }

        }
        
    }

}

print( paste( "Valor de p:", (1/exp(1)) ) )



