library(readxl)
library(data.table)
library(writexl)

db <- read_excel(file.choose(),sheet = "Database(Media)",col_types = "text")

setDT(db)



setorder(db,-`Year and Quarter`)
db[,print(.SD[1,16]),by="Client ID"]

a <- split(db,by="Client ID")

for (i in 1:1860) {
  a[[i]][,"Client Name":=.(a[[i]]$`Client Name`[1])]
}

final <- rbindlist(a)

write_xlsx(final,"C:/Users/fzhang/OneDrive - Travelzoo/Report/Quarterly/Media/Client_Name.xlsx")

