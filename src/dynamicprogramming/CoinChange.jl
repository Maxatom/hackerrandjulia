#=
CoinChange:
- Julia version: 1.0.0
- Author: shibing
- Date: 2019-04-18
=#

function inputFromFile()
    open("E:\\Projects\\hackerrankjulia\\src\\dynamicprogramming\\coinchangeTestData.txt") do file
        line=1; m=0; n=0
        for ln in eachline(file)
            if(line%2==1)
                str=split(ln)
                n=parse(Int,str[1])
                m=parse(Int,str[2])
                println("n=",n,", m=",m)
            else
                c=[parse(Int,x) for x in split(ln)]
                println("c=", c)
                println(waysOfCoinChange(n, m, c))
            end
            line += 1
        end
    end
end

# Enter your code here
function main()
    n=4; m=3; c=[1, 2, 3]  #4
    n=3; m=3; c=[1, 2, 3]  #4
    n=2; m=3; c=[1, 2, 3]  #4
    n=1; m=3; c=[1, 2, 3]  #4
    n=1; m=3; c=[1, 2, 3]  #4
    n=1; m=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
    n=2; m=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
    n=3; m=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
    n=4; m=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
    n=5; m=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
    n=7; m=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
    n=18; m=25; c=[48, 6, 34, 50, 49, 36, 30, 35, 40, 41, 17, 43, 39, 13, 4, 20, 19, 2, 46, 7, 38, 33, 28, 18, 21]
#    println(waysOfCoinChange(n, m, c))
    inputFromFile()
end
#dp[i][j] means the number of ways of making change with 1~ith coins
#1D array
function waysOfCoinChange(n::Int,m::Int,c::Array{Int,1})
    dp=zeros(Int,n)
    for i in 1:m
        for j in c[i]:n
            dp[j] += j==c[i] ? 1 : dp[j-c[i]]
        end
    #    println(dp)
    end
    return dp[n]
end
main()

