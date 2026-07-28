import canonicalLaneMathlib.AdmissibleClass
import BooleanHadamardMatricesCanonicalLaneLean.HadamardMatrixDefinition

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure WilliamsonConstructionPackage where
  circulantMatrices : Matrix (Fin 4) (Fin 4) (Matrix (Fin n) (Fin n) ℤ)
  williamsonArrayProperty : ∀ i, (circulantMatrices i).T = circulantMatrices i
  sumOfSquaresEquals : (circulantMatrices 0) ^ 2 + (circulantMatrices 1) ^ 2 + (circulantMatrices 2) ^ 2 + (circulantMatrices 3) ^ 2 = (4 : ℕ) * (1 : Matrix (Fin n) (Fin n) ℤ)
  constructHadamard : HadamardAdmittedObject

structure WilliamsonConstructionEvidence (W : WilliamsonConstructionPackage) where
  circulantSymmetricClosed : ∀ i, (W.circulantMatrices i).T = W.circulantMatrices i
  sumOfSquaresClosed : W.sumOfSquaresEquals
  constructHadamardClosed : HadamardMatrixClosed W.constructHadamard

def WilliamsonConstructionClosed (W : WilliamsonConstructionPackage) : Prop :=
  (∀ i, (W.circulantMatrices i).T = W.circulantMatrices i) ∧
  W.sumOfSquaresEquals ∧
  HadamardMatrixClosed W.constructHadamard

theorem williamson_construction_closed_from_evidence (W : WilliamsonConstructionPackage) (ev : WilliamsonConstructionEvidence W) : WilliamsonConstructionClosed W := by
  exact And.intro ev.circulantSymmetricClosed (And.intro ev.sumOfSquaresClosed ev.constructHadamardClosed)

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse