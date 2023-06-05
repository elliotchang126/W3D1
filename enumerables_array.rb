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

end