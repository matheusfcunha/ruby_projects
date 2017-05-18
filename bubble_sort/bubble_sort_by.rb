def bubble_sort_by(array)
    left_index = 0
    right_index = 1

    flag = false
    while !flag
        flag = true
        while right_index != array.size
            if yield(array[left_index], array[right_index]) > 0
                array[right_index], array[left_index] = array[left_index], array[right_index]
                flag = false
            end
            left_index += 1
            right_index += 1
        end
        left_index = 0
        right_index = 1
  end
  return array
end

print bubble_sort_by(%w(hi hello hey h heyyyyyyyyy)) { |left, right|
    left.length - right.length
}

## => ["hi", "hey", "hello"]
