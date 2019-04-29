#=
FibonacciModified:
- Julia version: 1.0.0
- Author: shibing
- Date: 2019-04-29
=#

function main()
    println(fibonacciModified(0,1,5))

#     inputFromFile()
end
function fibonacciModified(t1::Int64, t2::Int64, n::Int64)
    a1=big(t1); a2=big(t2); a3=big(0)
    for i in 3:n
        a3=a1+a2*a2
        a1=a2
        a2=a3
    end
    return a3
end

main()
