library(ggplot2)
library(dplyr)

data <- read.csv("C:\\Users\\mohan\\Downloads\\7.social_media_interactions.csv")

Platform_summary <- data %>%
  group_by(Platform,Post_Type)%>%
  summarise(Avg_Likes=mean(Likes),
            Avg_Shares = mean(Shares),
            Total_Posts = n(),
            .groups = 'drop'
  )
print(Platform_summary)

data <- data %>%
  mutate(Engagement_Category = cut(Engagement_Score, 
                                   breaks = c(0, 30, 70, 100), 
                                   labels = c("Low", "Medium", "High")))

print("--- Data with Binned Engagement Levels (First 5 rows) ---")
print(head(data[, c("Post_ID", "Engagement_Score", "Engagement_Category")]))

ggplot(data,aes(x=Platform,y=Likes,color=Post_Type))+
  geom_jitter(width = 0.2,height=0 , aplha = 0.7)+
  labs(
    title = "Likes Distribution by Platform (With Jittering)",
    subtitle = "Jittering helps visualize overlapping data points",
    x = "Social Media Platform",
    y = "Number of Likes"
  ) +
  theme_minimal()