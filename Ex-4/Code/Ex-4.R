# 23BAD105
# Saravanakumar G
library(ggplot2)

# 1. Encoding Accident Severity Using Color Gradient
# Uses geom_jitter to prevent overlapping points
ggplot(accidents, 
       aes(x = Location, 
           y = Severity_Num, 
           color = Severity_Num)) +
  geom_jitter(size = 3, alpha = 0.8) +
  scale_color_gradient(low = "yellow", high = "red") +
  labs(
    title = "Encoding Accident Severity Using Color Gradient",
    x = "Location",
    y = "Severity Level",
    color = "Severity"
  ) +
  theme_minimal()

# 2. Accident Frequency Represented Using Size
# Maps the 'Frequency' variable to the size of the points
ggplot(accident_freq, 
       aes(x = Location, 
           y = Frequency, 
           size = Frequency)) +
  geom_point(color = "blue", alpha = 0.7) +
  scale_size(range = c(3, 10)) +
  labs(
    title = "Accident Frequency Represented Using Size",
    x = "Location",
    y = "Number of Accidents",
    size = "Accident Frequency"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 3. Accident Type Represented Using Shape
# Helps distinguish categorical 'Accident_Type' data
unique(accidents$Accident_Type)

ggplot(accidents, 
       aes(x = Location, 
           y = Severity_Num, 
           shape = Accident_Type)) +
  geom_point(size = 3, color = "black") +
  labs(
    title = "Accident Type Represented Using Shape",
    x = "Location",
    y = "Severity Level",
    shape = "Accident Type"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))