library(stringr)

names <- read_csv("working/names_toR_140827.csv", skip = 1, 
                  col_names=c("index", "word","pinyin","word_order","fullname","firstname", 
                              "first_pinyin","school","dept" , "year","age", "id"   ))


names %>%
    filter(word_order == 0) %>%
    select(full.name = fullname, last.name = word, last.pinyin= pinyin, first.name=firstname, first.pinyin= first_pinyin, school, year) %>%
    mutate(national.colleges = str_detect(school, "國立") , 
           top.5.colleges =str_detect(school, "臺灣大學|政治大學|清華大學|成功大學|交通大學")) %>%
    select(-school) -> names

names %>%
    group_by(year) %>%
    sample_n(10000)  -> names.partial

names %>%
    group_by(year, first.name, first.pinyin) %>%
    summarise(n=n(), 
              national.colleges = sum(national.colleges), 
              top.5.colleges = sum(top.5.colleges)) %>% 
    group_by(first.name) %>%
    mutate(overall.n = sum(n)) -> college_admission

college_admission %>%
    group_by(year) %>%
    mutate(year.n=sum(n)) %>%
    filter(overall.n > 10) %>%
    mutate(n = (n/year.n*100000) , 
           national.colleges = (national.colleges/year.n*100000) ,
           top.5.colleges = (top.5.colleges/year.n*100000)  ) %>%
    select(-c(overall.n,year.n )) -> college_admission.save

college_admission.save %>% write_csv(., "working/R-tutorial/college_admission.csv")