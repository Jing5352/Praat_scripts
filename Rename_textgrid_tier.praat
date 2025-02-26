##This script renames TextGrid tiers in a batch
##26-02-2025, by Jing Tang, Utrecht NL

#Specify the directory/folder of the TextGrid files; 
#remember to add a backslash \ in the end; use forward slash / if you are using mac

directory$ = "C:\praat\new\"


#Read in the list of files by creating a string
files = Create Strings as file list: "filelist", directory$ + "\*.TextGrid"

#Check if the total number of files you want to rename is correct
numberOfFiles = Get number of strings
appendInfoLine: "Found" + " " + string$(numberOfFiles)+ " " + "TextGrid files"

#Loop over the files to rename them 
for i from 1 to numberOfFiles
     #Select the strings you created first
     selectObject: files

     #Get the file name
     fileName$ = Get string: i

     #Read in the files
     Read from file: directory$ + fileName$
    
     #Get the ID of the newly read-in TextGrid
     textGridID = selected("TextGrid")
     
     #Get the name of the first tier
     selectObject: 'textGridID'
     tierName$ = Get tier name: 1
     appendInfoLine: "File: " + fileName$ + ", First tier: " + tierName$

     #Rename the first tier and save the file
     Set tier name: 1, "word"
     Save as text file: directory$ + fileName$
endfor

appendInfoLine: "Done"
