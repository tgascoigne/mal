package lisp

type Type union {
	Nil,
	True,
	False,
	int,
	string,
	Symbol,
	List,
}

type Nil struct{}
type True struct{}
type False struct{}
type Symbol string
type List []Type
