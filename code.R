#Good reads data set: https://www.kaggle.com/datasets/jealousleopard/goodreadsbooks
#https://www.publicbooks.org/who-cares-about-literary-prizes/#fnref-30144-2
#Does this explosion have anything to do with the fall of the Soviet Union?  
dat <- read.csv("/Users/gregorymatthews/Dropbox/TheRobertHigneyProject/winnersandjudges.csv")

sub <- dat %>% filter(role == "winner") 

library(tidyverse)

sub <- dat %>% filter(role == "winner" & prize_name != "MacArthur Fellowship") %>% group_by(prize_year, prize_genre) %>% summarize(tot_prize = sum(prize_amount)) 
ggplot(aes(x = prize_year, y = tot_prize, colour = prize_genre), data = sub) + geom_line() + geom_point() + geom_vline(aes(xintercept = 1980))

sub <- dat %>% filter(role == "winner" & prize_name != "MacArthur Fellowship") %>% group_by(prize_year, prize_name) %>% summarize(tot_prize = sum(prize_amount)) 
ggplot(aes(x = prize_year, y = tot_prize, colour = prize_name), data = sub) + geom_line() + geom_point()


sub <- dat %>% filter(role == "winner" & prize_name != "MacArthur Fellowship" & prize_name %in% c("Pulitzer Prize","Metcalf Award","Kirkus Prize")) %>% group_by(prize_year, prize_name) %>% summarize(tot_prize = sum(prize_amount)) 
ggplot(aes(x = prize_year, y = tot_prize, color = prize_name), data = sub) + geom_line() + geom_point()

dat %>% filter(prize_name == "MacArthur Fellowship") %>% arrange(prize_year)

sub2 <- dat %>% filter(role == "winner" & prize_name != "MacArthur Fellowship")
table(sub2$prize_name)