import BooleanHadamardMatricesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
  A.gateWitness

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse