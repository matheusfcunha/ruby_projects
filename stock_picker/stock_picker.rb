def stock_picker(array)
    profit = []
    profit_index = []
    array_clone = array.clone

    array.length.times do
        array.each { |x| result = array.last - x; profit << result }
        array.pop
    end

    array_clone.length.times do
        array_clone.each do |x|
            result = array_clone.last - x
            if array_clone.last - x == profit.max
                profit_index << array_clone.index(x)
                profit_index << array_clone.index(array_clone.last)
            end
        end
        array_clone.pop
    end
    profit_index
end

stock_picker [17, 3, 6, 9, 15, 8, 6, 1, 10]
