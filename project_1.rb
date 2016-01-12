
# project 2

def bubble_sort(elements)
	checked = 0
	while true do
		old_array = elements.dup
		puts_largest_element_last(elements, checked)
		break if old_array == elements
		checked += 1
	end
	elements
end

def puts_largest_element_last(elements, checked)
	number_of_loops = elements.length - checked
	number_of_loops.times do |index|
		if index > 0
			left = elements[index-1]
			right = elements[index]
		  if left > right
			  swap(index -1, index, elements)
			end
		end
	end
	elements
end

def swap(largest, smallest, elements)
	bigger_number = elements[largest]
	elements[largest] = elements[smallest]
	elements[smallest] = bigger_number
end

# puts bubble_sort([4,3,78,2,0,2]).to_s

def bubble_sort_by(elements)
	original_array = elements
	right_side = 0
	index = 0
	total_runs = 0
	while total_runs < num_times(elements)
		if index > 0
			left = elements[index-1]
			right = elements[index]
			if (yield left, right).to_i > 0
				swap(index-1, index, elements)
			end
		end
		total_runs += 1
		index += 1
		if (index == elements.length-right_side)
			right_side += 1
			index = 0
			break if original_array == elements
		end
		original_array = elements.dup
	end
end

def num_times(elements)
	sum = 0
	count = 0
	elements.length.times do
		sum += elements.length-count
		count += 1
		break if count == elements.length-1
	end
	sum
end

hi_array = ["hafldkj", "hi","hello","hey", "helhafdlkja", "h"]

bubble_sort_by(hi_array) do |left,right|
  left.length - right.length
end

puts hi_array.to_s

