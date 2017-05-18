def bubble_sort(array)
    left_index = 0
    right_index = 1

  while array[0] != array.min
    while right_index != array.size
        sort = array[left_index] <=> array[right_index]
        if sort == 1
            array[right_index], array[left_index] = array[left_index], array[right_index]
        end
        left_index += 1
        right_index += 1
    end
    left_index = 0
    right_index = 1
  end
    return array
end

puts bubble_sort([4,3,78,2,0,2])
