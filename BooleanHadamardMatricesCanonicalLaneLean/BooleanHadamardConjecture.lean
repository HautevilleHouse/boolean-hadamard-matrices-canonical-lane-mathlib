import BooleanHadamardMatricesCanonicalLaneLean.BooleanHadamardAdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure ConjecturePackage (A : AdmissibleClass) where
  hadamardConjectureStatement : Prop
  ordersUpToCurrentBound : Prop
  hadamardConjectureStatementClosed : hadamardConjectureStatement
  ordersUpToCurrentBoundClosed : ordersUpToCurrentBound

structure ConjectureEvidence (A : AdmissibleClass) (C : ConjecturePackage A) where
  statementClosedEvidence : C.hadamardConjectureStatement
  ordersBoundClosedEvidence : C.ordersUpToCurrentBound

def ConjectureClosed (A : AdmissibleClass) (C : ConjecturePackage A) : Prop :=
  C.hadamardConjectureStatement ∧ C.ordersUpToCurrentBound

theorem conjecture_closed_from_evidence (A : AdmissibleClass) (C : ConjecturePackage A)
    (E : ConjectureEvidence A C) : ConjectureClosed A C := by
  exact And.intro E.statementClosedEvidence E.ordersBoundClosedEvidence

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse
