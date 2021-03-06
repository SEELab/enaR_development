## set plotting parameters
opar <- par(las=1,mar=c(0,0,0,0),xpd=TRUE,bg="white")

## Taken from https://stat.ethz.ch/pipermail/r-devel/2011-September/062126.html
if (all(ls()!='f.list')){
    require(codetools)
    library(enaR)
    called.by <- function(tarFunc, tarPack){
        flist <-   sapply(lsf.str(tarPack, all=TRUE), c)
        names(flist) <- NULL
        gotit <- sapply(flist, function(x) tarFunc %in% findGlobals(get(x, tarPack),FALSE)$functions)
        flist[gotit]
    }

    f.list <- as.character(sapply(lsf.str('package:enaR',all=TRUE),c))
    f.array <- array(0,dim=rep(length(f.list),2))
    rownames(f.array) <- colnames(f.array) <- f.list
    for (i in 1:length(f.list)){
        f.array[match(called.by(f.list[i],'package:enaR'),rownames(f.array)),i] <- 1
    }
    f.net <- network(t(f.array))
}

pdf('enaR-vignette-003')
plot(f.net,displaylabels=TRUE,label.cex=0.85,arrowhead.cex=0.65,
     edge.lwd=0.75,vertex.col='lightblue',vertex.border='white',edge.col='darkgrey')
dev.off()
