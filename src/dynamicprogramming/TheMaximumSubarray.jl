#=
TheMaximumSubarray:
- Julia version: 1.0.0
- Author: shibing
- Date: 2019-04-26
=#

function inputFromFile()
    filepath="E:\\Projects\\hackerrankjulia\\src\\dynamicprogramming\\inputFiles\\theMaximumSubarrayData.txt"
    open(filepath) do file
#         readline(file)
        while ((m=readline(file))!="")
            m=parse(Int64,m)
            A=[parse(Int64,x) for x in split(readline(file))]
            println(" ************* m= $m *************")
           println("max1=",maxSubarray(A))
        end
    end
end

function main()
        c=[1, 2, 3]  #4
        c=[-5, 4, -3, 4, 5]
#         n= 4; c= [1, 3, 1, 2]
#          n= 4; c= [9, 3, 10, 2]#, 6, 3,1]
#      n=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
#     println(maxSubarray(c))

    inputFromFile()
end

#dp
function maxSubarray(A::Array{Int64,1})
    n=length(A); maxs=typemin(Int64); pre=0; cur=0; positiveSum=0;
    for i in 1:n
            cur = pre<0 ? A[i] : (pre+A[i])
            maxs=max(maxs,cur)
            positiveSum += A[i]>0 ? A[i] : 0
            pre=cur;
    end
    return (maxs, maxs<0 ? maxs : positiveSum)
end

main()
