# io-symbols - Symbolic atoms for the Io Programming language

Copyleft (<-) 2012, Jacob Peck, No Rights Reserved.

## Overview

Many languages have these handy little datatypes called symbolic atoms.  These allow a programmer to create a name that isn't bound to any particular value, but is unique in value such that any two symbols sharing the same name always evaluate as being equal.  Common Lisp has influenced the design of this symbol library, with the addition of property lists attached to symbols, to allow a bit more flexibility.

### Example
Here's an annotated interactive session using io-symbols.  Example programs will be included in the future.

    $ io
    Io 20110905
    Io> doFile("Symbol.io") // first, we load the library.  You could also just type Symbol
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
    
    // use some p-lists, to interesting effect
    Io> :hello symbol_plist // get the plist of :hello
    ==> list()
    Io> :hello set(:printrep, "I'm a symbol called hello.") // set a property
    ==> :hello
    Io> :hello set(:age, 4)
    ==> :hello
    Io> :hello symbol_plist
    ==> list(:printrep, I'm a symbol called hello., :age, 4) // they're stored as pairs
    Io> :hello get(:age) // retrieve a property
    ==> 4
    Io> :hello get(:printrep)
    ==> I'm a symbol called hello.
    Io> :hello remove(:age) // remove a property
    ==> :hello
    Io> :hello get(:age) // invalid properties return nil
    ==> nil
    Io> :hello symbol_plist
    ==> list(:printrep, I'm a symbol called hello.)
    Io> out := method(symbol, writeln(symbol get(:printrep))) // using a method
    ==> method(symbol,
        writeln(symbol get(: printrep))
    )
    Io> out(:hello)
    I'm a symbol called hello.
    ==> nil
    
    // now, to end with a bang
    Io> block(x, if(x == :die, System exit)) call(:die)


## License

The base symbol implementation came from my work on the [jedi programming language](https://github.com/gatesphere/jedi), and over there, it's released under a BSD license.  However, this reworked version (with more functionality!) I am releasing into the public domain.  It's yours, bud.

## To do

Here's a short list of what needs to be done:

  * Example programs
