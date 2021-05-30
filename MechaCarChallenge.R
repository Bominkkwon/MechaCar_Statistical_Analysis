library(dplyr)
library(tidyverse)


MechaCar_mpg_table <- read.csv(file='MechaCar_mpg.csv')
Suspension_Coil_table <- read.csv(file='Suspension_Coil.csv')

MechaCar_mpg_table <- MechaCar_mpg_table %>% 
  rename(
    vlength = "vehicle_length", 
    vweight = "vehicle_weight", 
    spangle = "spoiler_angle", 
    grclearance = "ground_clearance")
head(MechaCar_mpg_table)

lm(formula = mpg ~ vlength + vweight + spangle + grclearance + AWD, data = MechaCar_mpg_table)

summary(lm(mpg ~ vlength + vweight + spangle + grclearance + AWD,MechaCar_mpg_table))
        

total_summary <-  data.frame(
Mean=mean(Suspension_Coil_table$PSI),
Median=median(Suspension_Coil_table$PSI),
Variance=var(Suspension_Coil_table$PSI),
SD=sd(Suspension_Coil_table$PSI))

show(total_summary)

lot_summary <- Suspension_Coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') 
