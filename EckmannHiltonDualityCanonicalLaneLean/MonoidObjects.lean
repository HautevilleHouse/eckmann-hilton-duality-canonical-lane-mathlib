import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure MonoidObject (X : Type u) where
  mul : X → X → X
  one : X
  mul_assoc : ∀ a b c : X, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : X, mul one a = a
  mul_one : ∀ a : X, mul a one = a

structure ComonoidObject (X : Type u) where
  comul : X → X × X
  counit : X → Unit
  coassoc : ∀ a : X, (Prod.map comul id) (comul a) = (Prod.map id comul) (comul a)
  left_counit : ∀ a : X, Prod.fst (comul a) = a
  right_counit : ∀ a : X, Prod.snd (comul a) = a

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse