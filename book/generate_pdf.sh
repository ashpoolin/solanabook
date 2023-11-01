#!/bin/bash

 input=$1                                                                                                                                                                       
                                                                                                                                                                                
 if [ -z "$input" ]; then                                                                                                                                                       
     rm ./*.pdf                                                                                                                                                                 
     for file in *.md; do                                                                                                                                                       
         cat "$file" | fold -sw 80 > tmp.md                                                                                                                                     
         pandoc -s -o "${file%.md}.pdf" tmp.md                                                                                                                                  
     done                                                                                                                                                                       
 else                                                                                                                                                                           
     rm "./${input%.md}.pdf"                                                                                                                                                    
     cat "$input" | fold -sw 80 > tmp.md                                                                                                                                        
     pandoc -s -o "${input%.md}.pdf" tmp.md                                                                                                                                     
 fi                                                                                                                                                                             
                                                                                                                                                                                
 rm tmp.md