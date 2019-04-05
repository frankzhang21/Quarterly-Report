library(readxl)
library(data.table)
library(writexl)

db <- read_excel(file.choose(),sheet = "Database(Media)",col_types = "text")

setDT(db)



setorder(db,-`Year and Quarter`)
db[,print(.SD[1,16]),by="Client Name"]

a <- split(db,by="Client Name")

for (i in 1:1897) {
  a[[i]][,"Category":=.(a[[i]]$`Category`[1])]
}

final <- rbindlist(a)

write_xlsx(final,"C:/Users/fzhang/OneDrive - Travelzoo/Report/Quarterly/Media/client_Category.xlsx")
