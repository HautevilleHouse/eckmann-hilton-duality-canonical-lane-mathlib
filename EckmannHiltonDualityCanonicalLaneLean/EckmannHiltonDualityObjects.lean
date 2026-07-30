import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure HSpace (M : Type u) where
  carrier : M
  multiplication : M → M → M
  unit : M
  multiplicationClosed : multiplication carrier unit = carrier ∧ multiplication unit carrier = carrier

structure Cogroup (M : Type u) where
  carrier : M
  comultiplication : M → M × M
  counit : M → Unit
  cocommutativity : Prop
  coassociativity : Prop
  counitLeft : Prop
  counitRight : Prop

structure AdmittedObject where
  spaceType : Type u
  hSpace : HSpace spaceType
  cogroup : Cogroup spaceType
  productCompatible : Prop
  conclusion : productCompatible

structure EndgameState where
  object : AdmittedObject

def EckmannHiltonWitnessClosed (O : AdmittedObject) : Prop :=
  O.productCompatible

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse