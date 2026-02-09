install.packages("GGally")
library(GGally)
library(ggplot2)

retail <- read.csv("C:\\Users\\mohan\\Downloads\\6.retail_business.csv")
head(retail)

retail_numeric <- retail[, sapply(retail, is.numeric)]

ggparcoord(
  data = retail_numeric,
  scale = "std",
  alphaLines = 0.4
) +
  ggtitle("Parallel Coordinate Plot - Retail Business Data") +
  theme_minimal()

library(GGally)
library(ggplot2)

ggparcoord(
  data = retail,
  columns = c(4, 5, 6),   
  groupColumn = "Region",
  scale = "std",
  alphaLines = 0.6
) +
  ggtitle("Parallel Coordinate Plot by Region") +
  theme_minimal()

ggplot(retail,
       aes(x = Sales,
           y = Profit,
           size = Discount,
           color = Region)) +
  geom_point(alpha = 0.7) +
  scale_size(range = c(3, 12)) +
  labs(
    title = "Bubble Chart of Retail Business Performance",
    x = "Sales",
    y = "Profit",
    size = "Discount",
    color = "Region"
  ) +
  theme_minimal()

ggplot(retail,
       aes(x = Sales, y = Profit)) +
  geom_point(color = "steelblue", alpha = 0.7) +
  facet_wrap(~ Region) +
  labs(
    title = "Trellis Display of Sales vs Profit by Region",
    x = "Sales",
    y = "Profit"
  ) +
  theme_minimal()


