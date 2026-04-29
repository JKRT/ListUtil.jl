using Test
using ListUtil
using MetaModelica

# Convert a MetaModelica List into a Vector so we can compare against a plain
# Julia array. Using listLength + listGet keeps the test independent of any
# Cons/Nil equality details.
function listToVec(lst)
    n = listLength(lst)
    v = Vector{Any}(undef, n)
    cur = lst
    for i in 1:n
        v[i] = listHead(cur)
        cur = listRest(cur)
    end
    return v
end

@testset "ListUtil smoke" begin
    @test isdefined(ListUtil, :map)
    @test isdefined(ListUtil, :fold)
    @test isdefined(ListUtil, :filterOnTrue)

    lst = list(1, 2, 3, 4)

    @test listToVec(ListUtil.map(lst, x -> x + 1)) == [2, 3, 4, 5]
    @test ListUtil.fold(lst, (x, acc) -> x + acc, 0) == 10
    # `filter` follows the MetaModelica fail-style convention (predicate throws
    # to reject), so for a boolean predicate we use `filterOnTrue`.
    @test listToVec(ListUtil.filterOnTrue(lst, iseven)) == [2, 4]

    empty = list()
    @test listLength(ListUtil.map(empty, x -> x + 1)) == 0
    @test ListUtil.fold(empty, (x, acc) -> x + acc, 0) == 0
end
