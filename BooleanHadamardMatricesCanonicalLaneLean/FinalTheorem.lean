import BooleanHadamardMatricesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

def ConstrainedBooleanHadamardClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_boolean_hadamard_endgame (A : AdmissibleClass) :
    ConstrainedBooleanHadamardClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse