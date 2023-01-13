CreateWorld(args);
craft
   i, j: craftint
   s: craftcharacter
   x: craftint
start
   i-> 5 * 8;
   j=i*3;
   x -> mine()
   hmm(x) trade
     start
	smelt(x+3);
     quit
quit