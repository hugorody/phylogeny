library(phangorn)
library(ape)

myfiles <- list.files(path = "/path/to/fasta/msa/files/", pattern = NULL, all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
           
for (fastafile in myfiles) {

infile <- paste(c("/path/to/fasta/msa/files/",fastafile),collapse="")
outfile <- paste(c(fastafile,".nwk"),collapse="")

print (paste(infile))

mytree <- read.phyDat(infile,format="fasta")
dm <- dist.ml(mytree)
treeNJ <- NJ(dm)
write.tree(treeNJ, file=outfile) #fastafile.nwk

}
