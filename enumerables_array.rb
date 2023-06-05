class Array

    def my_each(&block)
        i = 0

        while i < self.count
            block.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&block)
        array = []
        self.my_each do |i|
            array << i if block.call(i) 
        end
        # array << i if self.my_each {|i|  block.call(self[i]) }
        array
    end

    def my_reject(&block)
        array = []
        self.my_each do |i|
            array << i if !block.call(i) 
        end
        array
    end

    def my_any?(&block)
        self.my_each do |i|
            return true if block.call(i) 
        end
        false
    end

    def my_all?(&block)
        self.my_each do |i|
            return false if !block.call(i) 
        end
        true
    end

    def my_flatten
        array = []
        self.each do |ele|
            if ele.is_a?(Array)
                array += ele.my_flatten
            else
                array << ele
            end
        end
        array
    end

    def my_zip(*arrays)
        array = []

        self.each_with_index do |num, i|
            small_array = []
            small_array << num
            arrays.each_with_index do |array, i2|
                small_array << array[i]
            end
            array << small_array
        end
        array
    end

    def my_rotate(num=1)
        # dbugger
        if num > 0
            num.times do 
                ele = self.shift
                self << ele
            end
        else
            (-num).times do 
                ele = self.pop
                self.unshift(ele)
            end
        end
        self
    end
end