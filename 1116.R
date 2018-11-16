typeof(87.2)
#identify data types
##class() or typeof()
class(87.2)
class("I am a string")
class(TRUE)
class(FALSE)
class(NA)
class(NULL)
#caluculat how long
length(NA)
length(NULL)

my_ww <- c(1,2,3,4,NA)
sum(my_ww,na.rm = TRUE)

my_ww <- c(1,2,3,4,NULL)
sum(my_ww)

sys_time <- Sys.time()
sys_date <- Sys.Date()*
format(sys_time,"%B %d,%Y")
format(sys_date,"%A %B")
format(sys_date,"%j")
format(sys_date,"%W")

class(sys_time)
class(sys_date)
class("2018-11-16")
sys_date + 1

sys_date - as.numeric(sys_date)
as.numeric(as.Date("1969-12-31"))

sys_time - as.numeric(sys_time)
as.numeric(as.POSIXct("1970-01-01 07:59:59"))
greenwich_origin <- as.POSIXct("1970-01-01 00:00:00",
                               tz = "GMT")
OlsonNames()

install.packages("rvest")
library(rvest)

page_url <- "https://tw.stock.yahoo.com/d/i/rank.php?t=pri&e=tse&n=100"
html_doc <- page_url %>% 
    read_html(encoding = "big5")
ticker_name <- html_doc %>% 
    html_nodes(".name a") %>% 
    html_text()
price <- html_doc %>% 
    html_nodes(".name+ td") %>% 
    html_text()

as.numeric(price)
price[grepl(pattern = "KY", ticker_name)]
stock_df <- data.frame(ticker_name, price,
                       stringsAsFactors = FALSE)
View(stock_df)
View(stock_df[grepl(pattern = "KY", stock_df$ticker_name), ])
