import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonAlgebraicCore

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EckmannHiltonAdmittedObject where
  hopfAlgebra : Type u
  hopfAlgebraStruct : HopfAlgebraObject hopfAlgebra
  eckmannHiltonSatisfied : Prop
  conclusion : eckmannHiltonSatisfied

structure AdmissibleClass where
  object : EckmannHiltonAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.eckmannHiltonSatisfied) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse