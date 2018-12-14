def mydecorator (fn) :
	def wrapper (arg) :
		print("wrapped!")
		return fn(arg)
	return wrapper

@mydecorator
def foo(bar):
	print(bar)
	pass


foo("my string")
