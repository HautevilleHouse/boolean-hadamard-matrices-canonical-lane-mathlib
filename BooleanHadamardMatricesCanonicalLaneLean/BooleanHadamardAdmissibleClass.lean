import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure BooleanHadamardAdmittedObject where
  order : ℕ
  matrix : Type
  entries : {0,1}
  pairwiseOrthogonal : Prop
  conclusion : pairwiseOrthogonal

structure AdmissibleClass where
  object : BooleanHadamardAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse
