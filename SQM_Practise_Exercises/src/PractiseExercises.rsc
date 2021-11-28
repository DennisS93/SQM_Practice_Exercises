module PractiseExercises

import IO;
import List;
import Map;
import Relation;
import Set;
import analysis::graphs::Graph;
import util::Resources;
import lang::java::jdt::m3::Core;
import lang::java::m3::AST;
import vis::Figure;
import vis::Render;
import vis::KeySym;



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
   
   println("6d");
   //The name contains no n and also no e
   println({ a | a <- eu, /^[^en]*$/i := a });
   println();
   
   println("6e");
   //The name contains any letter at least twice
   println({ a | a <- eu, /<x:[a-z]>.*<x>/i := a });
   println();
   
   println("6f");
   //The name contains an a: the first a in the name is replaced by an o (for example: "Malta" becomes "Molta")
   println({ begin+"o"+eind | a <- eu, /^<begin:[^a]*>a<eind:.*>$/i := a });
   println();
   
}
//from answers
public rel[int, int] delers(int maxnum) {
   return { <a, b> | a <- [1..maxnum], b <- [1..a+1], a%b==0 };
}


public void exercise7() {
	println("7a");
	//Compute the relationship between the natural numbers up to 100 and their divisors. Optionally make the upper limit a parameter
	list[int] g100 = [1..100];
	println({ <g1, g2> | g1 <- g100, g2 <- g100, g1 > g2, g1%g2==0 });
	println();
	
	println("7b");
	//Compute which numbers have the most divisors	
	rel[int,int] listPairs = { <g1, g2> | g1 <- g100, g2 <- g100, g1 > g2, g1%g2==0 };
	println(listPairs);
	int maxCombinations = max(range(listPairs)); 

	//from answers
	rel[int, int] d = delers(100);
   	map[int, int] m = (a:size(d[a]) | a <- domain(d));
   	int maxdiv = max(range(m)); 
   	println({ a | a <- domain(d), m[a] == maxdiv });
   	// Compute the list of prime numbers (up to 100) in ascending order.
   	println("(7c)");
   	println(sort([ a | a <- domain(m), m[a] == 2 ]));
}
public Graph[str] uses = {<"A", "B">, <"A", "D">, 
   <"B", "D">, <"B", "E">, <"C", "B">, <"C", "E">, 
   <"C", "F">, <"E", "D">, <"E", "F">};
   
public void exercise8() {
   componenten = carrier(uses);

   println("(8a)");
   //How many components does the system consist of?
   println(size(componenten));
   println();

   println("(8b)");
   //How many dependencies are there between the components?
   println(size(uses));
   println();

   println("(8c)");
   //Which components are not used by any component?
   println(top(uses));
   println();
   
   println("(8d)");
   //Which components are needed (directly or indirectly) for A?
   println((uses+)["A"]);
   println();
   
   println("(8e)");
   //Which components are not used (directly or indirectly) by C?
   println(componenten - (uses*)["C"]);
   println();
   
   println("(8f)");
   //How often is each component used?
   println(( a:size(invert(uses)[a]) | a <- componenten ));
}

public set[loc] javaBestanden(loc project) {
   Resource r = getProject(project);
   return { a | /file(a) <- r, a.extension == "java" };
}
public void exercise9() {
	loc project = |project://JabberPoint/|;
	set[loc] bestanden = javaBestanden(project);
	println(size(bestanden));
}

public void allExercises() {
	exercise6();
	exercise7();
	exercise8();
	exercise9();
}