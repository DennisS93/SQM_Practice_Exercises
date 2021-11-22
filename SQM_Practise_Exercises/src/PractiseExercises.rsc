module PractiseExercises

import IO;

//exercises 1-4 installing and setting up git repo

public void exercise5() {
   println("Hello");
}


list[str] eu = ["Austria", "Belgium", "Bulgaria", "Czech Republic",
"Cyprus", "Denmark", "Estonia", "Finland", "France", "Germany",
"Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania",
"Luxembourg", "Malta", "The Netherlands", "Poland",
"Portugal", "Romania", "Slovenia", "Slovakia", "Spain",
"Sweden", "United Kingdom"];

public void exercise6() {
   println("6a");
   //The name contains the letter s
   println({ x | x <- eu, /s/i := x });
   println();
   
   println("6b");
   //The name contains (at least) two e’s
   println({ x | x <- eu, /e*e/i := x }); 
   println("6b 2nd try");
   println({ x | x <- eu, /e.*e/i := x });
   println();
   
   //rest of 6 from given answers
   
   println("6c");
   //The name contains exactly two e’s
   println({ a | a <- eu, /^([^e]*e){2}[^e]*$/i := a });
   println();
   
   println("(6d)");
   //The name contains no n and also no e
   println({ a | a <- eu, /^[^en]*$/i := a });
   println();
   
   println("(6e)");
   //The name contains any letter at least twice
   println({ a | a <- eu, /<x:[a-z]>.*<x>/i := a });
   println();
   
   println("(6f)");
   //The name contains an a: the first a in the name is replaced by an o (for example: "Malta" becomes "Molta")
   println({ begin+"o"+eind | a <- eu, /^<begin:[^a]*>a<eind:.*>$/i := a });
   println();
}