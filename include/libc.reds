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

 #import  [
	LIBM-file cdecl [
			fabsf: "fabsf" [
					x                       [float32!]
					return:         [float32!]
			]
			sinf:            "sinf" [
					radians         [float32!]
					return:         [float32!]
			]
			cosf:            "cosf" [
					radians         [float32!]
					return:         [float32!]
			]
			tanf:            "tanf" [
					radians         [float32!]
					return:         [float32!]
			]
			asinf:           "asinf" [
					radians         [float32!]
					return:         [float32!]
			]
			acosf:           "acosf" [
					radians         [float32!]
					return:         [float32!]
			]
			atanf:           "atanf" [
					radians         [float32!]
					return:         [float32!]
			]
			atan2f:          "atan2f" [
					y                       [float32!]
					x                       [float32!]
					return:         [float32!]
			]
			sqrtf:          "sqrtf" [
					x                       [float32!]
					return:         [float32!]
			]
	]
]