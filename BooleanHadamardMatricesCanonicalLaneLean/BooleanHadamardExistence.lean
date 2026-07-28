import BooleanHadamardMatricesCanonicalLaneLean.BooleanHadamardAdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure ExistencePackage (A : AdmissibleClass) where
  orderMultipleOfFour : Prop
  knownOrdersUpToLimit : Prop
  orderMultipleOfFourClosed : orderMultipleOfFour
  knownOrdersUpToLimitClosed : knownOrdersUpToLimit

structure ExistenceEvidence (A : AdmissibleClass) (P : ExistencePackage A) where
  orderMultipleOfFourClosedEvidence : P.orderMultipleOfFour
  knownOrdersUpToLimitClosedEvidence : P.knownOrdersUpToLimit

def ExistenceClosed (A : AdmissibleClass) (P : ExistencePackage A) : Prop :=
  P.orderMultipleOfFour ∧ P.knownOrdersUpToLimit

theorem existence_closed_from_evidence (A : AdmissibleClass) (P : ExistencePackage A)
    (E : ExistenceEvidence A P) : ExistenceClosed A P := by
  exact And.intro E.orderMultipleOfFourClosedEvidence E.knownOrdersUpToLimitClosedEvidence

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse
