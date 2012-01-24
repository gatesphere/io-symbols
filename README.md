# io-symbols - Symbolic atoms for the Io Programming language

Copyright (c) 2012, Jacob Peck, All Rights Reserved.

## Overview

Many languages have these handy little datatypes called symbolic atoms.  These allow a programmer to create a name that isn't bound to any particular value, but is unique in value such that any two symbols sharing the same name always evaluate as being equal.  Common Lisp has influenced the design of this symbol library, with the addition of property lists attached to symbols, to allow a bit more flexibility.

### Example
Here's an annotated interactive session using io-symbols.  Example programs will be included in the future.

    $ io
    Io 20110905
    Io> doFile("Symbol.io") // first, we load the library
    ==>  SymbolTable_0xc37478:
      clone            = method(...)
      get              = method(name, ...)
      table            = Map_0xe9bb38
      type             = "SymbolTable"

    Io> :hi // making a symbol is easy... just put a : in front of something!
    ==> :hi
    Io> :hi == :hi // symbols always equal themselves
    ==> true
    Io> :hi == :bye // but are unique with regards to everything else
    ==> false
    
    // let's use symbols to make a ternary value, of sorts
    Io> tellthetruth := method(query,
    ...   if(query == :yes, writeln("Okay..."))
    ...   if(query == :no, writeln("NEVER!"))
    ...   if(query == :maybe, writeln("I might tell you...someday."))
    ... )
    ==> method(query,
        if(query == : yes, writeln("Okay...")) if(query == : no, writeln("NEVER!")) if(query == :
    maybe, writeln("I might tell you...someday."))
    )
    // and let's test it...
    Io> tellthetruth(:yes)
    Okay...
    ==> false
    Io> tellthetruth(:maybe)
    I might tell you...someday.
    ==> nil
    Io> tellthetruth(:no)
    NEVER!
    ==> false
    // awesome! it works!
    
    // now, to end with a bang
    Io> block(x, if(x == :die, System exit)) call(:die)


## License

The base symbol implementation came from my work on the [jedi programming language](https://github.com/gatesphere/jedi), and over there, it's released under a BSD license.  However, this reworked version (with more functionality!) I am releasing into the public domain.  It's yours, bud.

## To do

Here's a short list of what needs to be done:

  * Property lists (Common Lisp style)
  * Example programs
