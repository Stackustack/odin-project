require_relative "bubble_sort"

bubble_sort([5,4,3,2,1,12,4,125,643,346,1,1,1,1,-5])

bubble_sort_by(["hi","bish","hello","hey","foobar","bazoor"]) do |left,right|
	left.length - right.length
end