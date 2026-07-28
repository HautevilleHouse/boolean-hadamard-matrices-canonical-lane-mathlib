import BooleanHadamardMatricesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BooleanHadamardWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion.1

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse