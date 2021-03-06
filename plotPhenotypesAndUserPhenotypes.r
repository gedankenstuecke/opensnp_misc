Sys.setlocale("LC_TIME","en_US.utf8")
svg("phenotypes_vs_userphenotypes.svg")
pheno <- read.table("phenotypes.txt", sep="\t")
usersp <- read.table("./user_phenotypes.txt", sep="\t")
par(mar=c(5, 4, 4, 6))
plot(sort(strptime(pheno[,2], "%d.%m.%Y %H:%M")), pheno[,1],type="l", xlab="Time", ylab="Amount of unique phenotypes",xaxt="n")
dmin <- min(strptime(pheno[,2], format="%d.%m.%Y %H:%M"))
dminjan <-  as.POSIXct(format(dmin, "%Y-1-1"))

seqYear <- seq(dminjan, by = "1 month", to = max(strptime(pheno[,2], format="%d.%m.%Y %H:%M")) + (86400 * 365))
axis(1, at = seqYear, labels = format(seqYear, "%b-%y"), las = 1)
par(new=T)
plot(sort(strptime(usersp[,2], "%d.%m.%Y %H:%M")), usersp[,1],type="l",xlab="", yaxt="n",col="red",xaxt="n",ylab="")
axis(4,col.axis="red")
mtext("Amount of entered phenotypes", side=4,line=3,col="red")
dev.off()

