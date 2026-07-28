import canonicalLaneMathlib.AdmissibleClass
import BooleanHadamardMatricesCanonicalLaneLean.HadamardMatrixDefinition

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure OrthogonalityConstraintPackage where
  n : ℕ
  H : Matrix (Fin n) (Fin n) ℤ
  rowOrthogonality : ∀ i, (H ∗ H.T) i i = n
  distinctRowsOrthogonal : ∀ i j, i ≠ j → (H ∗ H.T) i j = 0
  columnOrthogonality : ∀ i, (H.T ∗ H) i i = n
  distinctColsOrthogonal : ∀ i j, i ≠ j → (H.T ∗ H) i j = 0

structure OrthogonalityConstraintEvidence (O : OrthogonalityConstraintPackage) where
  rowOrthogonalityClosed : O.rowOrthogonality
  distinctRowsOrthogonalClosed : O.distinctRowsOrthogonal
  columnOrthogonalityClosed : O.columnOrthogonality
  distinctColsOrthogonalClosed : O.distinctColsOrthogonal

def OrthogonalityConstraintClosed (O : OrthogonalityConstraintPackage) : Prop :=
  O.rowOrthogonality ∧ O.distinctRowsOrthogonal ∧ O.columnOrthogonality ∧ O.distinctColsOrthogonal

theorem orthogonality_constraint_closed_from_evidence (O : OrthogonalityConstraintPackage) (ev : OrthogonalityConstraintEvidence O) : OrthogonalityConstraintClosed O := by
  exact And.intro ev.rowOrthogonalityClosed (And.intro ev.distinctRowsOrthogonalClosed (And.intro ev.columnOrthogonalityClosed ev.distinctColsOrthogonalClosed))

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse