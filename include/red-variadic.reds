Red/System[]

R: context [ ; for red-value! replaced by variadic
	#enum red-variadic! [
		i f p h
	]

	i?: func [
		count 	[int-ptr!] list [int-ptr!]
		return:	[integer!]
		/local
			val		[integer!]
	][
		count/value: count/value - 1
		val: list/value
		list: list + 1
		val
	]

	f?: func [
		count 	[int-ptr!] list [int-ptr!]
		return:	[float!]
		/local
			val  [float!]
	][
		count/value: count/value - 1
		val: as float! list/value
		list: list + 1
		val
	]

	h?: func [
		count	[int-ptr!] list [int-ptr!]
		return:	[handle!]
		/local
			val		[handle!]
	][
		count/value: count/value - 1
		val: as handle! list/value
		list: list + 1
		val
	]

	p?: func [
		count	[int-ptr!] list [int-ptr!]
		val1	[int-ptr!] val2	[int-ptr!]
	][
		count/value: count/value - 1
		val1/value: list/value
		list: list + 1
		count/value: count/value - 1
		val2/value:  list/value
		list: list + 1
	]

]