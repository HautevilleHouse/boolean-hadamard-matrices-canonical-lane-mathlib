import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure HadamardAdmittedObject where
  n : ℕ
  H : Matrix (Fin n) (Fin n) ℤ
  entriesAreOneOrNegOne : ∀ i j, H i j = 1 ∨ H i j = -1
  orthogonalRows : ∀ i j, i ≠ j → (∑ k, H i k * H j k) = 0
  conclusion : orthogonalRows

structure HadamardMatrixClosed (O : HadamardAdmittedObject) : Prop where
  entriesCondition : O.entriesAreOneOrNegOne
  orthogonalityCondition : O.orthogonalRows

definition hadamard_matrix_closed_from_object (O : HadamardAdmittedObject) : HadamardMatrixClosed O := {
  entriesCondition := O.entriesAreOneOrNegOne
  orthogonalityCondition := O.orthogonalRows
}

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse