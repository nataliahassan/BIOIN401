install.packages("circlize")
install.packages("GFF")
install.packages("Rtools")
install.packages("ape")

library(circlize)
library(ape)

setwd("C:/Users/tyler/Desktop/test")

# read idea from from https://www.rdocumentation.org/packages/ape/versions/5.4-1/topics/read.gff
test1 <-read.gff("AUG_eustigma.gff",na.strings = c(".", "?"),GFF3 = TRUE)

# get only the 3 coloumns seqid, start, and end. Idea from https://www.listendata.com/2015/06/r-keep-drop-columns-from-data-frame.html
test2 <- subset(test1,select = +c(seqid,start,end))

# code ideas from https://mran.microsoft.com/snapshot/2014-12-11/web/packages/circlize/vignettes/genomic_plot.pdf
circos.clear()
par(mar = c(1, 1, 1, 1))
circos.par("start.degree" = 90)
circos.initializeWithIdeogram(test2)
circos.genomicTrackPlotRegion(ylim = c(0, 1),bg.col=c("brown"),bg.border = NA, track.height = 0.05)
n = max(sapply(test2, length))
circos.genomicTrackPlotRegion(ylim = c(0.5, n + 0.5),
                              panel.fun = function(region, value, ...) {
                                gn = get.cell.meta.data("sector.index")
                                tr = test2[[gn]] # all transcripts for this gene
                                for(i in seq_along(tr)) {
                                  # for each transcript
                                  current_tr_start = min(tr[[i]]$start)
                                  current_tr_end = max(tr[[i]]$end)
                                  circos.lines(c(current_tr_start, current_tr_end),
                                               c(n - i, n - i), col = "#CCCCCC")
                                  circos.genomicRect(tr[[i]], ytop = n - i + 0.4,
                                                     ybottom = n - i - 0.4, col = "orange", border = NA)
                                }
                              }, bg.border = NA, track.height = 0.3)
circos.clear()



circos.clear()