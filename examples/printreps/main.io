// this program creates some symbols and uses plists for print representations

out := method(symbol,
  writeln(symbol get(:printrep))
)

:1 set(:printrep, "one")
:2 set(:printrep, "two")
:3 set(:printrep, "three")

list(:1, :2, :3) foreach(i, out(i))
