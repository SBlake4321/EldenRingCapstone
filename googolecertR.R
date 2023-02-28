glimpse(firevspoise)


ggplot(data=firevspoise,aes(x=Fire,y=Poise))+
  geom_point(aes(shape=category, color=category))

ggplot(data=wieghtvspoise,aes(x=weight,y=Poise))+
  geom_point(aes(shape=category, color=category))