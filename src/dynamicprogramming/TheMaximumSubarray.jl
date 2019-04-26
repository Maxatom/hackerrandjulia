#=
TheMaximumSubarray:
- Julia version: 1.0.0
- Author: shibing
- Date: 2019-04-26
=#
function main()
        n=3; c=[1, 2, 3]  #4
        n=3; c=[5, 4, 3, 4, 5]
        n= 4; c= [1, 3, 1, 2]
         n= 4; c= [9, 3, 10, 2]#, 6, 3,1]
     n=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
#     println(stockmax(n, c))
#     println(stockmax1(n, c))
#     println(stockmax2(n, c))

#     inputFromFile()
end

#dp
function maxSubarray(A::Array{Int32,1})
    n=length(A)
    
end

main()
