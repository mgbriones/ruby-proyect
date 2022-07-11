def findMedian(arr)
   # Write your code here
   largo = arr.length
   arr = arr.sort

   if largo == 1
      m = arr[0]  

   elsif largo % 2 == 0
       m = arr[largo/2 -1]

   else
       m = arr[(largo -1)/2]
   end
   # puts arr

   return m
   
end

# 7
# 0 1 2 4 6 5 3

arr = [0, 1, 2, 4, 6, 5, 3]

puts findMedian(arr)
