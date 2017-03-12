install.packages("tidyverse")
library(tidyverse)

traffic2 <- read_csv("~/Desktop/traffic.csv")
traffic2 %>%
    rename( time.year = 發生年,
           time.month = 發生月 ,
           time.day = 發生日 ,
           time.hour = 發生時 ,
           time.minute = 發生分 ,
           event.level = 處理別,
           location.district = 區序,
           location.address = 肇事地點 ,
           number.dead = 死亡人數 ,
           number.injury = 受傷人數 ,
           party.sn= 當事人序 ,
           vehicle.type = 車種,
           party.gender = 性別,
           party.age = 年齡 ,
           party.injury = 受傷程度 ,
           location.weather = 天候 ,
           location.speed.limit = 速限 ,
           location.road.type = 道路型態,
           location.type = 事故位置 ) %>% write_csv("~/Desktop/traffic_eng.csv")

traffic <- read_csv("~/Desktop/traffic_eng.csv")




