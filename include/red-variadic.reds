Red/System[]

R: context [ ; for red-value! replaced by variadic
	#enum red-variadic! [
		i f h l
	]

	i?: func [
		count 	[int-ptr!] list [int-ptr!]
		return:	[integer!]
		/local
			val		[integer!]
	][
		unless null? count [count/value: count/value - 1]
		list/value
	]

	f?: func [
		count 	[int-ptr!] list [int-ptr!]
		return:	[float!]
	][
		unless null? count [count/value: count/value - 1]
		as float! list/value
	]

	h?: func [
		count	[int-ptr!] list [int-ptr!]
		return:	[handle!]
	][
		unless null? count [count/value: count/value - 1]
		as handle! list/value
	]

	l?: func [
		count	[int-ptr!] list [int-ptr!]
		return:	[logic!]
	][
		unless null? count [count/value: count/value - 1]
		as logic! list/value
	]

]