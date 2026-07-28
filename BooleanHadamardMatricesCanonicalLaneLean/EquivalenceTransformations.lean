import BooleanHadamardMatricesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure EquivalenceTransformation where
  name : String
  action : Matrix (Fin n) (Fin n) ℤ → Matrix (Fin n) (Fin n) ℤ
  preservesHadamard : ∀ (H : Matrix (Fin n) (Fin n) ℤ),
    (H * Hᵀ = (n : ℤ) • 1) → (action H * (action H)ᵀ = (n : ℤ) • 1)
  preservesBoolean : ∀ (H : Matrix (Fin n) (Fin n) ℤ),
    (∀ i j, H i j = 1 ∨ H i j = -1) → (∀ i j, action H i j = 1 ∨ action H i j = -1)

def equivClosed (T : EquivalenceTransformation) : Prop :=
  T.preservesHadamard ∧ T.preservesBoolean

theorem equiv_closed_from_proof (T : EquivalenceTransformation) : equivClosed T :=
  And.intro T.preservesHadamard T.preservesBoolean

-- Examples: row/column permutations, sign flips

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse