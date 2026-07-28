import BooleanHadamardMatricesCanonicalLaneLean.HadamardExistence

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure ClassificationPackage where
  maxOrder : ℕ
  classifiedOrders : List ℕ
  classificationMap : ∀ (order ∈ classifiedOrders),
    List (Matrix (Fin order) (Fin order) ℤ) -- representatives up to equivalence
  completenessProof : ∀ (order ∈ classifiedOrders),
    ∀ (H : Matrix (Fin order) (Fin order) ℤ),
      (H * Hᵀ = (order : ℤ) • 1 ∧ ∀ i j, H i j = 1 ∨ H i j = -1) →
        ∃ (rep : Matrix (Fin order) (Fin order) ℤ),
          rep ∈ classificationMap order ∧
          ∃ (T : EquivalenceTransformation), T.action H = rep

def ClassificationClosed (C : ClassificationPackage) : Prop :=
  C.completenessProof

theorem classification_closed_from_evidence (C : ClassificationPackage) (E : C.completenessProof) :
    ClassificationClosed C :=
  E

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse