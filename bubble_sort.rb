def bubble_sort(numbers)
	sorted = false

	while !sorted
		sorted = true
		(numbers.size - 1).times do |index|
			if numbers[index] > numbers[index+1] 
				numbers[index+1], numbers[index] = numbers[index], numbers[index+1]
				sorted = false
			end
		end
	end

	puts "Sorted numbers: #{numbers}"

end



def bubble_sort_by(array)
	sorted = false

	while !sorted
		sorted = true
		(array.size - 1).times do |index|
			compare = yield array[index], array[index+1]
			if compare > 0 
			 	array[index+1], array[index] = array[index], array[index+1]
			 	sorted = false
			end 
		end
	end

	puts "Sorted array: " + array.inspect
	
end