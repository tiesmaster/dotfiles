def DecToHex(dec):
	hex = dec % 16
	if dec - hex == 0:
		return ToChar(hex)
	else:
		return DecToHex( (dec-hex)/16) + ToChar(hex)
	
def ToChar(A):
	return "0123456789ABCDEF"[A]

def DecToHex_new(dec, hex):
	if dec == 0:
		return hex
	else:
		return DecToHex_new(dec / 16, str(hex) + ToChar(dec % 16))
	
def ToChar(A):
	return "0123456789ABCDEF"[A]

for i in xrange(15):
	print i, DecToHex_new(i, '')
