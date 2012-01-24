// Io symbolic atom library
// Jacob M. Peck

// todo:
// p-lists
// examples

Object : := method(
  name := call argAt(0)
  SymbolTable get(name)
)

OperatorTable addOperator(":", 1)

Symbol := Object clone do(
  str ::= ""
  
  init := method(
    self str = ""
  )
  
  with := method(string,
    Symbol clone setStr(string)
  )
  
  asString := method(
    ":" .. self str
  )
)

SymbolTable := Object clone do(
  table := Map clone
  
  clone := method(self) // singleton
  
  get := method(name,

    self table atIfAbsentPut(name asString, Symbol with(name asString))
  )
)
