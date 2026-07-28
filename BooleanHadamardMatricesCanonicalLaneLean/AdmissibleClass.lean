import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure BooleanHadamardAdmittedObject where
  order : ℕ
  matrix : Matrix (Fin order) (Fin order) ℤ
  isHadamard : Prop
  isBoolean : Prop
  conclusion : isHadamard ∧ isBoolean

structure AdmissibleClass where
  object : BooleanHadamardAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BooleanHadamardWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse