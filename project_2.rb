module Enumerable

	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i+=1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i+=1
		end
		self
	end

	def my_select
		selected_array = []
		self.size.times do |index|
			if yield(self[index])
				selected_array.push(self[index])
			end
		end
		selected_array
	end

	def my_all?
		self.size.times do |index|
			if !yield(self[index])
				return false
			end
		end
		true
	end

	def my_any?
		self.size.times do |index|
			if yield(self[index])
				return true
			end
		end
		false
	end

	def my_none?
		if my_any?
			return false
		else
			return true
		end
	end

	def my_count
		count = 0
		self.size.times do |index|
			count += 1 if yield(self[index])
		end
		count
	end

	def my_map(given_proc=false)
		self.size.times do |index|
			if given_proc
				self[index] = given_proc.call(self[index])
				self[index] = yield(self[index]) if block_given?
			end
		end
		self
	end

	def my_inject(start_val=false)
		index = 0
		if !start_val
			start_val = self[0]
			index = 1
		end
		last_iteration = start_val
		while index < self.size
			last_iteration = yield(last_iteration, self[index])
			index += 1
		end
		last_iteration
	end
end

def multiply_els(elements)
	elements.my_inject { |prev, num| prev *= num }
end
