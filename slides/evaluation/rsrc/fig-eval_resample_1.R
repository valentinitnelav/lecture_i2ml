 
library(knitr)
library(mlbench)
library(mlr)
library(OpenML)

library(ggplot2)
library(viridis)
library(gridExtra)
library(ggrepel)
library(repr)

library(data.table)
library(BBmisc)


library(party)
library(kableExtra)
library(kknn)
library(e1071)

options(digits = 3, width = 65, str = strOptions(strict.width = "cut", vec.len = 3))


plot_lp = function(...){
  plotLearnerPrediction(...) + scale_fill_viridis_d()
}

scale_c_d <- scale_colour_discrete <- scale_color_discrete <-
  function(...) {
    viridis::scale_color_viridis(..., end = .9, discrete = TRUE, drop = TRUE)
  }


library(plyr)
library(kernlab)
set.seed(600000)
pdf("../figure/eval_resample_1.pdf", width = 8, height = 3.5)
layout(cbind(rep(1, 3), 2:4, matrix(5:16, ncol = 4, byrow = TRUE)))
par(mar = c(2,2,4,2))

plot(as.factor(c(rep(1, 3), 2)), axes = FALSE, ylim = c(0, 5), col = c("#E69F00","#56B4E9"), main = "Class Distribution")
box()

par(mar = c(1,1,1,1))
red.ind = c(1, 6, 11)
for (i in 1:3) {
  plot.new()
  text(0.5, 0.5, cex = 1.2, paste("Iteration", i))
}
for (i in 1:12) {
  if (i %% 4 == 0) {
    plot.new()
    # text(0.5, 0.5, cex = 2, bquote(paste("=> ",widehat(GE)[D[test]^.(i/4)])))
  } else {
    plot(as.factor(c(rep(1, 3), 2)),
         axes = FALSE, ylim = c(0, 5), col = c("#E69F00","#56B4E9"))
    if (i %in% red.ind) {
      rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "#E69F0055")
      box(col = "#E69F00")
      plot(as.factor(c(rep(1, 3), 2)),
           axes = FALSE, ylim = c(0, 5), col = c("#E69F00","#56B4E9"), add = TRUE)
    } else {
      rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "#56B4E955")
      box()
      plot(as.factor(c(rep(1, 3), 2)),
           axes = FALSE, ylim = c(0, 5), col = c("#E69F00","#56B4E9"), add = TRUE)
    }
  }
}

ggsave("../figure/eval_resample_1.pdf", width = 8, height = 3.5)
dev.off()

