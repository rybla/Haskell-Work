ex1 = [x*2 | x <- [1..10]]

f x = x*x*x
quad = [ f x | x <- [-100..100] ]

ex2 = [x*2 | x <- [1..10], x*2 >= 12]