CreateWorld(args);
craft
   i, j: craftint
start
   mine(i);
   j->i+1;
   smelt(5+4);
   hmm (i) trade
	start
	  smelt(i)
	quit
	else
	  smelt(j)
quit.