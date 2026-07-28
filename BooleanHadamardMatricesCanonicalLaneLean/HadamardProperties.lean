import BooleanHadamardMatricesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure HadamardProperties where
  order : ℕ
  determinantFormula : Prop
  eigenvalues : Prop
  existenceConjecture : Prop

structure HadamardPropertiesEvidence (H : HadamardProperties) where
  determinantFormulaClosed : H.determinantFormula
  eigenvaluesClosed : H.eigenvalues
  existenceConjectureClosed : H.existenceConjecture

def HadamardPropertiesClosed (H : HadamardProperties) : Prop :=
  H.determinantFormula ∧ H.eigenvalues ∧ H.existenceConjecture

theorem hadamard_properties_closed_from_evidence (H : HadamardProperties) (E : HadamardPropertiesEvidence H) :
    HadamardPropertiesClosed H := by
  exact And.intro E.determinantFormulaClosed (And.intro E.eigenvaluesClosed E.existenceConjectureClosed)

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse