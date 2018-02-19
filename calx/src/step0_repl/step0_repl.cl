package main

import c

READ :: fn(s: string) -> string {
	return s
}

EVAL :: fn(s: string) -> string {
	return s
}

PRINT :: fn(s: string) -> string {
	return s
}

rep :: fn(s: string) -> string {
	return PRINT(EVAL(READ(s)))
}

get_line :: fn() -> string {
	buf: [[256]]char
	return c.gets(&buf as *char)
}

main :: fn() {
	for {
		c.printf("user> ")
		input := get_line()
		if input == "\0" {
			return
		}
		output := rep(input)
		c.printf("%s\n", output)
	}
}
