@testset "unit tests" begin

    @testset "rse_sum" begin
        @test rse_sum(1:3) == 6
        @test rse_sum(1:36) == 666
        @test rse_sum(0) == 0
        @test_throws MethodError rse_sum("strings should not work")
    end

    @testset "rse_mean" begin
        @test rse_mean(1:3) == 2
        @test rse_mean(-15:17) == 1
        @test rse_mean(0) == 0
        @test_throws MethodError rse_mean("strings still should not work")
    end

    @testset "rse_std" begin
        @test rse_std(1:3) == 1
        @test_throws MethodError rse_std("strings")
    end

    @testset "rse_tstat" begin
        @test rse_tstat(2:3) == 5.0
        @test rse_tstat(1:3; σ=1.0) ≈ 3.464 atol = 1e-3
        @test_throws MethodError rse_tstat("strings")
    end

end

@testset "integration test" begin

    @testset "StatResult" begin
        result = StatResult(1:3)
        @test result.x == [1, 2, 3]
        @test result.n == 3
        @test result.std == 1.0
        @test result.tvalue ≈ 3.464 atol = 1e-3
    end

end
