library(dplyr)
library(tidyverse)


MechaCar_mpg_table <- read.csv(file='MechaCar_mpg.csv')
Suspension_Coil_table <- read.csv(file='Suspension_Coil.csv')

head(MechaCar_mpg_table)

lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg_table)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,MechaCar_mpg_table))
        

total_summary <-  data.frame(
Mean=mean(Suspension_Coil_table$PSI),
Median=median(Suspension_Coil_table$PSI),
Variance=var(Suspension_Coil_table$PSI),
SD=sd(Suspension_Coil_table$PSI))

show(total_summary)

lot_summary <- Suspension_Coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') 

t.test(x=Suspension_Coil_table$PSI,mu=1500)
lot1_subset <- subset(Suspension_Coil_table, Manufacturing_Lot=='Lot1') 
t.test(x=lot1_subset$PSI, mu=1500) 
lot2_subset <- subset(Suspension_Coil_table, Manufacturing_Lot=='Lot2') 
t.test(x=lot2_subset$PSI, mu=1500) 
lot3_subset <- subset(Suspension_Coil_table, Manufacturing_Lot=='Lot3') 
t.test(x=lot3_subset$PSI, mu=1500)


