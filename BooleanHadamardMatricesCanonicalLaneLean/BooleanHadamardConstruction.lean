import BooleanHadamardMatricesCanonicalLaneLean.BooleanHadamardAdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure ConstructionPackage (A : AdmissibleClass) where
  sylvesterConstruction : Prop
  paleyConstruction : Prop
  williamsonConstruction : Prop
  sylvesterConstructionClosed : sylvesterConstruction
  paleyConstructionClosed : paleyConstruction
  williamsonConstructionClosed : williamsonConstruction

structure ConstructionEvidence (A : AdmissibleClass) (C : ConstructionPackage A) where
  sylvesterClosedEvidence : C.sylvesterConstruction
  paleyClosedEvidence : C.paleyConstruction
  williamsonClosedEvidence : C.williamsonConstruction

def ConstructionClosed (A : AdmissibleClass) (C : ConstructionPackage A) : Prop :=
  C.sylvesterConstruction ∧ C.paleyConstruction ∧ C.williamsonConstruction

theorem construction_closed_from_evidence (A : AdmissibleClass) (C : ConstructionPackage A)
    (E : ConstructionEvidence A C) : ConstructionClosed A C := by
  exact And.intro E.sylvesterClosedEvidence (And.intro E.paleyClosedEvidence E.williamsonClosedEvidence)

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse
