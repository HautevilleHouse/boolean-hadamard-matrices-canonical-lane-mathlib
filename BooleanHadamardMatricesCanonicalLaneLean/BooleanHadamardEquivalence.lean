import BooleanHadamardMatricesCanonicalLaneLean.BooleanHadamardAdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure EquivalencePackage (A : AdmissibleClass) where
  signChangeInvariant : Prop
  permutationInvariant : Prop
  complementOperation : Prop
  signChangeInvariantClosed : signChangeInvariant
  permutationInvariantClosed : permutationInvariant
  complementOperationClosed : complementOperation

structure EquivalenceEvidence (A : AdmissibleClass) (E : EquivalencePackage A) where
  signChangeClosedEvidence : E.signChangeInvariant
  permutationClosedEvidence : E.permutationInvariant
  complementClosedEvidence : E.complementOperation

def EquivalenceClosed (A : AdmissibleClass) (E : EquivalencePackage A) : Prop :=
  E.signChangeInvariant ∧ E.permutationInvariant ∧ E.complementOperation

theorem equivalence_closed_from_evidence (A : AdmissibleClass) (E : EquivalencePackage A)
    (Ev : EquivalenceEvidence A E) : EquivalenceClosed A E := by
  exact And.intro Ev.signChangeClosedEvidence (And.intro Ev.permutationClosedEvidence Ev.complementClosedEvidence)

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse
