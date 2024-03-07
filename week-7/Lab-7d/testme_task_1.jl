# include -
include("Include.jl")

# ----------------------------------------------------------------------------------
# for more information on tests, see: https://docs.julialang.org/en/v1/stdlib/Test/
# ----------------------------------------------------------------------------------

# Testset - let's write a unit test for each *public* function in our code!
@testset verbose = true "Build stoichiometric matrix" begin

    @testset "build reation list tests" begin

        # initialize -
        path_to_test_file = joinpath(_PATH_TO_DATA, "Network.net");

        # build the reaction list -
        R = readreactionfile(path_to_test_file,comment="//");

        # how many reactions should we have?
        @test length(R) == 95

        # test - is the correct type?
        @test typeof(R) == Dict{Int64, MyChemicalReactionModel};

        # test - do we have the biomass eqn correct?
        @test R[95].name == "R_Biomass_Ecoli_core_w_GAM";

        # test - do we have the correct stoichiometry for the biomass eqn?
        biomass_reaction = R[95];
        @test biomass_reaction.stoichiometry["M_atp_c"] == -59.81;
        @test biomass_reaction.stoichiometry["M_nadph_c"] == -13.0279;
        @test biomass_reaction.stoichiometry["M_h2o_c"] == -59.81;
        @test biomass_reaction.stoichiometry["M_h_c"] == 59.81;
        @test biomass_reaction.stoichiometry["M_pi_c"] == 59.81;
        @test biomass_reaction.stoichiometry["M_nadp_c"] == 13.0279;
        @test biomass_reaction.stoichiometry["M_adp_c"] == 59.81;
        @test biomass_reaction.stoichiometry["M_pyr_c"] == -2.8328;
        @test biomass_reaction.stoichiometry["M_nadh_c"] == 3.547;
        @test biomass_reaction.stoichiometry["M_nad_c"] == -3.547;

        # add test for the stoichiometric matrix model -
        S = build(MyStoichiometricMatrixModel, R);
        @test typeof(S) == MyStoichiometricMatrixModel;
        @test length(S.species) == 92;
        @test length(S.reactions) == 95;
    end
end