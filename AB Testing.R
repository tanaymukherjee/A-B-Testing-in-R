# Tanay Mukherjee
# 06/11/2019

# https://www.inertia7.com/projects/193

# install.packages("tidyverse")
library(tibble)
library(dplyr)

# set seed for experiment replicability
set.seed(100)

# calculate our sample size in group_a and group_b
power.prop.test(p1 = 0.7, p2 = 0.75, power = 0.8)

# mocking data for group_a: control group
group_a <- tibble(
  user_id = seq(1, 3000, by = 2),
  test_group = rep(c("a"), 1500),
  completed_assessment = sample(
    c("completed", "not_completed"),
    1500,
    replace = TRUE,
    prob = c(0.7, 0.3)
  ),
  overall_score = rnorm(1500, mean = 100, sd = 15)
)

# mocking data for group_b: treatment group
group_b <- tibble(
  user_id = seq(2, 3000, by = 2),
  test_group = rep(c("b"), 1500),
  completed_assessment = sample(
    c("completed", "not_completed"),
    1500,
    replace = TRUE,
    prob = c(0.65, 0.35)
  ),
  overall_score = rnorm(1500, mean = 98, sd = 12)
)


# exploring group_a: the control
glimpse(group_a)
group_a %>% 
  count(completed_assessment)


# exploring group_b: the experiment
glimpse(group_b)
group_b %>% 
  count(completed_assessment)

# joining our control and experiment groups
group_a_b <- bind_rows(group_a, group_b)

# arraging data by user_id
arranged_group_a_b <- group_a_b %>% 
  arrange(user_id)

# preview of new working dataset
arranged_group_a_b

# generating table of completions by test group
prop_table <- table(
  arranged_group_a_b$test_group,
  arranged_group_a_b$completed_assessment
)

# two-sample proportion test
prop.test(prop_table)
