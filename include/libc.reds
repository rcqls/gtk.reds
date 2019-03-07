Red/System[]

;; Most of the LIBC are already imported in red/system
;; add it here some of them that are not in red/system/libc.reds 

#import [
		LIBC-file cdecl [
			strstr: "strstr" [					"Search for sub-string."
				string			[c-string!]
				substring		[c-string!]
				return:			[c-string!]
			]
			strcpy: "strcpy" [					"Copy string including tail marker, return target."
				target			[c-string!]
				source			[c-string!]
				return:			[c-string!]
			]
		]
]