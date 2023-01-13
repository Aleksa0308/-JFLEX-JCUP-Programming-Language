// import section
import java_cup.runtime.*;

%%
// declaration section
%class MPLexer

%cup

%line
%column

%eofval{
	return new Symbol( sym.EOF );
%eofval}

%{
   public int getLine()
   {
      return yyline;
   }
%}


//states
%state COMMENT
//macros
slovo = [a-zA-Z]
cifra = [0-9]

%%
// rules section
\(\*			{ yybegin( COMMENT ); }
<COMMENT>\*\)	{ yybegin( YYINITIAL ); }
<COMMENT>.		{ ; }

[\t\r\n ]		{ ; }

//operators
\+				{ return new Symbol( sym.PLUS ); }
\*				{ return new Symbol( sym.MUL );  }

//separators
;				{ return new Symbol( sym.SEMI );	}
,				{ return new Symbol( sym.COMMA );	}
\.				{ return new Symbol( sym.DOT ); }
:				{ return new Symbol( sym.DOTDOT ); }
->				{ return new Symbol( sym.ASSIGN ); }
\(				{ return new Symbol( sym.LEFTPAR ); }
\)				{ return new Symbol( sym.RIGHTPAR ); }

//keywords
"CreateWorld"		{ return new Symbol( sym.CREATEWORLD );	}	
"craft"			{ return new Symbol( sym.CRAFT );	}
"craftint"		{ return new Symbol( sym.CRAFTINT );	}
"craftchar"			{ return new Symbol( sym.CRAFTCHAR );	}
"mine"			{ return new Symbol( sym.MINE );	}
"smelt"			{ return new Symbol( sym.SMELT );	}
"hmm"			{ return new Symbol( sym.HMM );	}
"trade"			{ return new Symbol( sym.TRADE );	}
"else"			{ return new Symbol( sym.ELSE );	}
"start"			{ return new Symbol( sym.START );	}
"quit"			{ return new Symbol( sym.QUIT );	}

//id-s
{slovo}({slovo}|{cifra})*	{ return new Symbol( sym.ID, yyline, yytext() ); }

//constants
\'[^]\'			{ return new Symbol( sym.CONST, yyline, new Character( yytext().charAt(1) ) ); }
{cifra}+		{ return new Symbol( sym.CONST, yyline, new Integer( yytext() ) ); }


//error symbol
.		{ System.out.println( "ERROR: " + yytext() ); }

