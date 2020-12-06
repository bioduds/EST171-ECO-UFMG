## Eduardo Capanema
## eduardocapanema@ufmg.br

library( dash )
library( dashHtmlComponents )
library( dashCoreComponents )

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccInput( id="graphTitle", value="Let's Simulatesss!", type="text" ),
      htmlDiv( id = "outputID" ),
      dccGraph( id = "giraffe",
                figure = list(
                    data = list( x=c( 1, 2, 3 ), y=c( 3, 2, 8 ), type="bar" ),
                    layout = list( title="Let's Simulate!" )
        )
      )
    )
  )
)

app$callback( output=list( id="giraffe", property="figure" ),
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
                       list( x=df$x, y=df$y, type="scatter" ),
                       list( x=df$x, y=df$y2, type="scatter" )
                     ),
                   layout = list( title=newTitle )
                 )
               }
)

app$callback( output=list( id="outputID", property="children" ),
              params = list( input( "graphTitle", "value" ), state( "graphTitle", "type" ) ),
              function( x, y ) {
                 sprintf( "You've entered: '%s' into a '%s' input control", x, y )
             }
)

app$run_server( showcase=FALSE )
