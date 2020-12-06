## Eduardo Capanema
## eduardocapanema@ufmg.br

library( plotly )

S = 1:200
N = 10
allMedias = c()

for( band in 1:length(S) ) {
    allDraws = c()
    for( i in 1:S[band] ) {
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
    allMedias <- append( allMedias, mean( allDraws[band] ) )
}
print( allMedias )

fig <- plot_ly( type="scatter", x=1:length(S), y = allMedias,
                marker = list( size=length(allMedias), color='rgba(255, 182, 193, .9)', line=list( color='rgba(152, 0, 0, .8)', width=2 ) ) )
fig <- fig %>% layout( title = 'Compras de Figurinhas',
         yaxis = list( zeroline = FALSE ),
         xaxis = list( zeroline = FALSE ) )

fig

library( dash )
library( dashHtmlComponents )
library( dashCoreComponents )

app <- Dash$new()

app$layout(
    htmlDiv(
        list(
            htmlDiv( allMedias[0] ),
            dccGraph( figure=fig ) 
        )
    )
)

app$run_server( debug=TRUE, dev_tools_hot_reload=TRUE, showcase=FALSE )