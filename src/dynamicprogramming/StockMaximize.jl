#=
StockMaximize:
- Julia version: 1.0.0
- Author: shibing
- Date: 2019-04-25
=#

function inputFromFile()
    filepath="E:\\Projects\\hackerrankjulia\\src\\dynamicprogramming\\inputFiles\\stockMaximizeData.txt"
    filepath="D:\\文档\\input00.txt"
    open(filepath) do file
        readline(file)
        while ((m=readline(file))!="")
            m=parse(Int64,m)
            c=[parse(Int64,x) for x in split(readline(file))]
             println(" ************* m= $m *************")
#            @time println("max =", stockmax(m, c))
           @time println("max1=",stockmax1(m, c))
           @time println("max2=",stockmax2(m, c))
        end
    end
end

function main()
        n=3; c=[1, 2, 3]  #4
        n=3; c=[5, 4, 3, 4, 5]
        n= 4; c= [1, 3, 1, 2]
         n= 4; c= [9, 3, 10, 2]#, 6, 3,1]
     n=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
#     println(stockmax(n, c))
#     println(stockmax1(n, c))
#     println(stockmax2(n, c))

    inputFromFile()
end

#dp run the loop backward
function stockmax2(n::Int64, prices::Array{Int64,1})
    n=length(prices); i=n-1; max=prices[n]; profit=0
    while i>0
        if prices[i]<max
            profit+=max-prices[i]
        else
            max=prices[i]
        end
        i-=1
    end
    return profit
end

mutable struct Profit
    index::UInt16
    shares::UInt16
    profit::Int64
end
#stack O(N)
function stockmax1(n::Int64, prices::Array{Int64,1})
    n=length(prices); stack=Array{Profit}(undef,n);
    top=1; stack[1]=Profit(1,1,0);
     #println("stack = $stack, stack[top]=$(stack[top]) ,top=$top ")
    for i in 2:n
        temp=Profit(i,1,0)
        tops=stack[top]
        while prices[i]>=prices[tops.index]
            #println("in... stack = $stack, stack[top]=$(stack[top]) ,dop=$top ,temp=$temp, i=$i, $(prices[tops.index]), $prices, tops=$tops")
            temp.profit+=(prices[i]-prices[tops.index])*tops.shares+tops.profit
            temp.shares+=tops.shares
            top-=1 #pop the top
            if(top>0) tops=stack[top]; else break end
        end
        top+=1; stack[top]=temp
         #println("stack = $stack, stack[top]=$(stack[top]) ,top=$top ")
    end
    max=0
    while top>0
        max+=stack[top].profit
        top-=1
    end
    return max
end

#sort O(NlogN)
function stockmax(n::Int64, prices::Array{Int64,1})
    n=length(prices)
    perm=sortperm(prices)
   #  println(perm)
    max=perm[n]; maxProfit::Int64=0; maxi=n; cursum::Int64=0; premax=0;
    for i = 1:n
        if(i<max)
            cursum+=prices[i]
        else
            maxProfit+= (i-premax-1)*prices[i]-cursum
            #println("i= $i, max=$max")
            premax=i
            cursum=0
            while maxi>0 && perm[maxi]<=max
              maxi-=1
            end
            if maxi==0 break end
            max=perm[maxi]
        end
    end
    return maxProfit
end
main()