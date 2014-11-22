microsoft-ngrams
================

query the [microsoft ngram service](http://weblm.research.microsoft.com/info/QuickStart.htm) with R

  - Contains only a simple R script.
  - Script sends a word-n-gram (a phrase comprising n single words) to the Microsoft ngram service
  - Returns a dataframe with 2 columns: nextword, probabilities. 


##### Example:

Phrase  `"time to take a"` sent to the service

returns:

    
       nextword   prob
    1      look -1.007
    2     break -1.435
    3   picture -1.665
    4       few -1.752
    5    policy -1.768
    6    moment -1.818
    7    chance -1.829
    8    closer -1.863
    9      step -1.873
    10    stand -1.916
    
