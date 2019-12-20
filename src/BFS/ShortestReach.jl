#=
ShortestReach:
- Julia version: 1.0.0
- Author: Administrator
- Date: 2019-12-20
=#

function inputFromFile()
    open("E:\\Projects\\hackerrankjulia\\src\\BFS\\inputFiles\\shortestReachData.txt") do file
        q=parse(Int64,readline(file))
        for i in 1:q
            str=split(readline(file))
            n=parse(Int64,str[1])
            m=parse(Int64,str[2])
            edges=Array{Int64}(undef,m,2)
#             println("n=",n,", m=",m,", edges=", edges)
            for j in 1:m
                edge=[parse(Int64,x) for x in split(readline(file))]
                edges[j,1]=edge[1]
                edges[j,2]=edge[2]
            end
            s=parse(Int64, readline(file))
            shortestPath(n,m,edges,s);
        end
    end
end
mutable struct Node
    num::Int64
    next::Union{Node, Nothing}
end

mutable struct Graph
    nodes::Array{Node,1}
end

function shortestPath(n::Int64, m::Int64, edges::Array{Int64,2}, s::Int64)
    println(n,",edges=",edges,", s=",s)
    graph=createGraph(n, m, edges)
    dfs(graph, s);
end
mutable struct Queue
    head::Node
    tail::Node
    size::Int64
end

function bfs(graph::Graph, s::Int64)
    n=length(graph.nodes)
    dist=0;
    queue=Queue(Node(0,nothing),Node(0,nothing),0)
    res=Array{Int64}(-1,n)
    queue.head=graph.nodes[s]; queue.size+=1;
    while queue.size!=0
        node=queue.head.next;

    end

end

function createGraph(n::Int64, m::Int64, edges::Array{Int64,2})
    graph=Graph(Array{Node}(undef,n))
    for i in 1:n
        graph.nodes[i]=Node(i,nothing)
    end
    for i in 1:m
        temp=graph.nodes[edges[i,1]].next
        graph.nodes[edges[i,1]].next=Node(edges[i,2],temp)
    end
end

function main()
    inputFromFile()
end

main()
