#This script creates a txt file that can be used to upload questions directly onto Qualtrics.
#The specific format requirements for this type of file can be found here: https://www.qualtrics.com/support/survey-platform/survey-module/survey-tools/import-and-export-surveys/

#to run this script, you will need 3 things:

#1. a csv file containing all of your stimuli. If you have more than one list (e.g. different versions
#of the same stimulus are counterbalanced across different lists), have one list per column

#2. if you want each question to be labelled a certain way in Qualtrics (the Question ID next to each question)
#then you also need a csv file with all of your labels (in the same order as the stimuli they correspond to).
#Again, if you have multiple lists, have one per column (same order as the stimuli lists)

#3. if you want your surveys to have a first block with, e.g., demographic information questions etc, and/or 
#instructions, you can write this manually following the Qualtrics documentation linked above.
#Save this as a txt file and name it 'firstblock.txt' (or change the script below)



#set to the directory of your files
setwd("------------------------------------------")

options(stringsAsFactors=F)

#change this to the name of your stimulus list file
#if the file doesn't have headers, set header=F
stimLists = read.csv('-------.csv', header=T)

#change this to the name of your labels list file
stimLabels = read.csv('---------.csv', header=T)


#if you have any columns in your files other than the lists, use this to remove those extra columns:
#stimLists$X <- NULL #remove index varialbe X


#change this to the name of your first block txt file
firstblock = read.csv('firstblock.txt',header=F)


#this keeps track of which list number you're on
n = 1


#this loops over each column in stimLists (each individual list) and makes a new character array ('compiled'),
#made up of your first block and each of your stimuli after they've been correctly formatted
#it then saves this as a txt file that can be used in Qualtrics

for(i in names(stimLists)){
  
  compiled = firstblock$V1
  
  stims = stimLists[[i]]
  stims = gsub("'", "'", stims) #replace apostrophe character since it wasn't recognized in qualtrics
  
  labs = stimLabels[[i]]
  
  #loop over each stimulus and add formatting
  for(j in 1:length(stims)){
    
    stimLab = paste('[[ID:', labs[j], ']]', sep='') #insert correct label
    
    #here you can insert the type of question and/or responses for each stimulus. Edit this based on the Qualtrics documentation
    #currently it's set as a multiple choice question, with horizontally presented choices
    #this is useful for plausibility norms:
    question = c('[[Question:MC:SingleAnswer:Horizontal]]', stimLab, stims[j], '[[Choices]]',
                 '1 - Makes no sense at all',
                 '2 - Is very strange',
                 '3 - Is a bit strange',
                 '4 - Neutral',
                 '5 - Makes some sense',
                 '6 - Makes a lot of sense',
                 '7 - Makes perfect sense')
    
    #for cloze norms use this (single line text entry):
    #question = c('[[Question:TE:SingleLine]]', stimLab, stims[j])
    
    
    compiled = c(compiled, question)
    
    
  }
  
  #change this to however you want to name the resulting txt file
  listname = paste('------------', n, '.txt', sep='')
  
  write(compiled, file = listname, sep = "/n")
  
  n = n+1
}


