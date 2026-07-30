import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.MonoidObjects

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure BialgebraObject (X : Type u) where
  monoid : MonoidObject X
  comonoid : ComonoidObject X
  compatibility : ∀ a b : X, comonoid.comul (monoid.mul a b) = (monoid.mul (Prod.fst (comonoid.comul a)) (Prod.fst (comonoid.comul b)), monoid.mul (Prod.snd (comonoid.comul a)) (Prod.snd (comonoid.comul b)))

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse