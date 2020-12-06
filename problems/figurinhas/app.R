## Eduardo Capanema
## eduardocapanema@ufmg.br

library( dash )
library( dashHtmlComponents )
library( dashCoreComponents )

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccInput( id="graphTitle", value="Figurinhasss", type="text" ),
      htmlDiv( id="outputID" ),
      dccGraph( id="plota",
                figure = list(
                    data = list( x=c( 1, 2, 3 ), y=c( 3, 2, 8 ), type="scatter" ),
                    layout = list( title="Let's Simulate!" )
        )
      )
    )
  )
)

app$callback( output=list( id="plota", property="figure" ),
              params=list( input( "graphTitle", "value" ) ),
              function( newTitle ) {
                 rand1 <- sample( 1:100, 1 )
                 rand2 <- sample( 1:100, 1 )
                 rand3 <- sample( 1:100, 1 )
                 rand4 <- sample( 1:100, 1 )
                 rand5 <- sample( 1:100, 1 )
                 rand6 <- sample( 1:100, 1 )
                 x <- c( 1, 2, 3 )
                 y <- c( rand1, rand2, rand3 )
                 y2 <- c( rand4, rand5, rand6 )
                 df = data.frame( x, y, y2 )
                 list(
                   data =
                     list(
                       list( x=df$x, y=df$y, type="box" ),
                       list( x=df$x, y=df$y2, type="box" )
                     ),
                   layout = list( title=newTitle )
                 )
               }
)

app$callback( output=list( id="outputID", property="children" ),
              params = list( input( "graphTitle", "value" ), state( "graphTitle", "type" ) ),
              function( x, y ) {

                ##############################################################################################
                S = 3000
                N = 25
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
                resp = round( mean( allDraws ) )
                ##############################################################################################

                sprintf( "Numero de Compras de pacotes com uma figurinha: %s", resp )

             }
)

app$run_server( showcase=FALSE )
