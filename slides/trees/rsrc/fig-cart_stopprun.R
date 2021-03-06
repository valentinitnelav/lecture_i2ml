 
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
library(rpart)
library(rpart.plot)
library(randomForest)
library(rattle)
library(smoof)
library(kableExtra)
library(kknn)
library(e1071)
library(rattle)

library(plyr)
library(kernlab)

options(digits = 3, width = 65, str = strOptions(strict.width = "cut", vec.len = 3))



scale_c_d <- scale_colour_discrete <- scale_color_discrete <-
  function(...) {
    viridis::scale_color_viridis(..., end = .9, discrete = TRUE, drop = TRUE)
  }


lrn = makeLearner("regr.rpart", maxdepth = 2)
mod = train(lrn, bh.task)
mod = mod$learner.model


set.seed(123)

#figure 1
pdf("../figure/cart_stopprun_1.pdf", width = 8, height = 5.8)
cps = rev(mod$cptable[-4, "CP"])
rattle::fancyRpartPlot(mod, sub = "Full tree")

ggsave("../figure/cart_stopprun_1.pdf", width = 8, height = 5.8)
dev.off()

#figure 2
pdf("../figure/cart_stopprun_2.pdf", width = 8, height = 5.8)
cps = rev(mod$cptable[-4, "CP"])
cps = cps[1]
lapply(cps, function(x) {
  p = rpart::prune(mod, cp = x)
  sub_title = sprintf("Pruning with complexity parameter = %.3f.", x)
  rattle::fancyRpartPlot(p, sub = sub_title)
})
ggsave("../figure/cart_stopprun_2.pdf", width = 8, height = 5.8)
dev.off()

#figure 3
pdf("../figure/cart_stopprun_3.pdf", width = 8, height = 5.8)
cps = rev(mod$cptable[-4, "CP"])
#rattle::fancyRpartPlot(mod, sub = "Full tree")
cps = cps[2]
lapply(cps, function(x) {
  p = rpart::prune(mod, cp = x)
  sub_title = sprintf("Pruning with complexity parameter = %.3f.", x)
  rattle::fancyRpartPlot(p, sub = sub_title)
})
ggsave("../figure/cart_stopprun_3.pdf", width = 8, height = 5.8)
dev.off()

#figure 4
pdf("../figure/cart_stopprun_4.pdf", width = 8, height = 5.8)
cps = rev(mod$cptable[-4, "CP"])
#rattle::fancyRpartPlot(mod, sub = "Full tree")
cps = cps[3]
lapply(cps, function(x) {
  p = rpart::prune(mod, cp = x)
  sub_title = sprintf("Pruning with complexity parameter = %.3f.", x)
  rattle::fancyRpartPlot(p, sub = sub_title)
})
ggsave("../figure/cart_stopprun_4.pdf", width = 8, height = 5.8)
dev.off()
