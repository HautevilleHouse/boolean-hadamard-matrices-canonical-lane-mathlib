import canonicalLaneMathlib.AdmissibleClass
import BooleanHadamardMatricesCanonicalLaneLean.HadamardMatrixDefinition

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure ExistenceConditionPackage where
  n : ℕ
  orderCondition : n ≡ 0 [MOD 4] ∨ n = 1 ∨ n = 2
  knownConstructions : n ≡ 0 [MOD 4] → ∃ (O : HadamardAdmittedObject), O.n = n
  knownExceptions : Prop

structure ExistenceConditionEvidence (E : ExistenceConditionPackage) where
  orderConditionClosed : E.orderCondition
  knownConstructionsClosed : E.knownConstructions
  knownExceptionsClosed : E.knownExceptions

def ExistenceConditionClosed (E : ExistenceConditionPackage) : Prop :=
  E.orderCondition ∧ E.knownConstructions ∧ E.knownExceptions

theorem existence_condition_closed_from_evidence (E : ExistenceConditionPackage) (ev : ExistenceConditionEvidence E) : ExistenceConditionClosed E := by
  exact And.intro ev.orderConditionClosed (And.intro ev.knownConstructionsClosed ev.knownExceptionsClosed)

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse