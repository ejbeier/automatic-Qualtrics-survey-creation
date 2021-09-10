# automatic-Qualtrics-survey-creation
A script to generate Qualtrics-ready txt files from a list of stimuli / questions. 
The txt file can be used to automatically generate a Qualtrics survey without having to manually create each question. See https://www.qualtrics.com/support/survey-platform/survey-module/survey-tools/import-and-export-surveys/

The script was originally written to create online psycholinguistics norming studies (e.g. cloze probability, plausibility, grammaticality).

To run this script, you will need 3 things:

1. a csv file containing all of your stimuli. If you have more than one list (e.g. different versions
of the same stimulus are counterbalanced across different lists), have one list per column

2. if you want each question to be labelled a certain way in Qualtrics (the Question ID next to each question)
then you also need a csv file with all of your labels (in the same order as the stimuli they correspond to).
Again, if you have multiple lists, have one per column (same order as the stimuli lists)

3. if you want your surveys to have a first block with, e.g., demographic information questions etc, and/or 
instructions, you can write this manually following the Qualtrics documentation linked above.
Save this as a txt file and name it 'firstblock.txt' (or change the script below)
