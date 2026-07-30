import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonTheorem
import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.AlgebraicTheory

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EHAdmittedObject where
  carrier : Type
  ehPair : EHPair carrier

def EHWitnessClosed (O : EHAdmittedObject) : Prop :=
  ∀ a b : O.carrier, O.ehPair.star a b = O.ehPair.star b a

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse
