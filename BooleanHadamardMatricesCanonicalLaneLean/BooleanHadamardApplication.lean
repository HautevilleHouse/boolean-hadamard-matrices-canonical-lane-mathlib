import BooleanHadamardMatricesCanonicalLaneLean.BooleanHadamardAdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure ApplicationPackage (A : AdmissibleClass) where
  errorCorrectingCode : Prop
  balancedIncompleteBlockDesign : Prop
  quantumInformation : Prop
  errorCorrectingCodeClosed : errorCorrectingCode
  balancedIncompleteBlockDesignClosed : balancedIncompleteBlockDesign
  quantumInformationClosed : quantumInformation

structure ApplicationEvidence (A : AdmissibleClass) (App : ApplicationPackage A) where
  errorCorrectingCodeClosedEvidence : App.errorCorrectingCode
  balancedIncompleteBlockDesignClosedEvidence : App.balancedIncompleteBlockDesign
  quantumInformationClosedEvidence : App.quantumInformation

def ApplicationClosed (A : AdmissibleClass) (App : ApplicationPackage A) : Prop :=
  App.errorCorrectingCode ∧ App.balancedIncompleteBlockDesign ∧ App.quantumInformation

theorem application_closed_from_evidence (A : AdmissibleClass) (App : ApplicationPackage A)
    (Ev : ApplicationEvidence A App) : ApplicationClosed A App := by
  exact And.intro Ev.errorCorrectingCodeClosedEvidence
    (And.intro Ev.balancedIncompleteBlockDesignClosedEvidence Ev.quantumInformationClosedEvidence)

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse
