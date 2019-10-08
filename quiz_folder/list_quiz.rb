

def three_even?(list)                                                               #Complete
     if list.size < 3
        return false
     end
     evens = 0
     list.each do |n|
        if n % 2 == 0
            evens += 1
        else
            evens = 0
        end
        if evens == 3
            return true
        end
     end
     return false
end

# puts three_even?([2,1,3,5]) #==> False
# puts three_even?([2,4,12,5]) #==> True
# puts three_even?([2,1,4,6]) #==> False



def bigger_two(list1, list2)
    list1_sum = 0
    list2_sum = 0
    
    list1.each do |n|
        list1_sum += n
    end
    list2.each do |m|
        list2_sum += m
    end

    if list1_sum >= list2_sum
        return list1
    else
        return list2
    end
end

# print bigger_two([1,2],[3,4]) #==> [3,4]
# print bigger_two([1,7],[4,4]) #==> [1,7]


def series_up(n)
    list = [0]
    length = n*(n+1)/2
    i = 0
    length.times do
        
        list[]
    end

end

puts series_up(1) #==> [1]
puts series_up(2) #==>[1,1,2]
puts series_up(3) #==>[1,1,2,1,2,3]
puts series_up(4) #==>[1,1,2,1,1,2,3,1,2,3,4]