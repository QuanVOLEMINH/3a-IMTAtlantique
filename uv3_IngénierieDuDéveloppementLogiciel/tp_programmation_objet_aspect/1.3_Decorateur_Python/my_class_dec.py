import traceback

class mydecorator (object):
	def __init__(self, arg):
		self.arg = arg
	def __call__(self, fn):
		def wrapper (arg):
			print('\n')
			print(self.arg)
			for line in traceback.extract_stack():
				if 'bar' in line:
					return fn(arg + '\n=>> with bar\n')
			return fn(arg + '\n=>> without bar\n')
		return wrapper


@mydecorator("common foo wrapped")
def foo(x):
	print(x)
	#bar("This is inside bar.")

def bar(s):
	foo(s)
	
foo("This is *not* inside bar.")
print("=====")
bar("This is inside bar.")
