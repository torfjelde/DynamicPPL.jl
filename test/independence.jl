@testset "Turing independence" begin
    @model coinflip(y) = begin
        p ~ Beta(1, 1)
        N = length(y)
        for i = 1:N
            y[i] ~ Bernoulli(p)
        end
    end
    model = coinflip([1,1,0])

    vi = VarInfo()

    runmodel!(model, vi, SampleFromPrior(), LikelihoodContext())
end
