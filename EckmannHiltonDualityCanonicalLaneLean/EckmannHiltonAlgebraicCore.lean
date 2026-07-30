import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure MonoidObject (M : Type u) where
  unit : M
  mul : M → M → M
  mulAssoc : ∀ a b c : M, mul (mul a b) c = mul a (mul b c)
  unitLeft : ∀ a : M, mul unit a = a
  unitRight : ∀ a : M, mul a unit = a

structure ComonoidObject (C : Type u) where
  counit : C → C
  comul : C → C × C
  coassoc : ∀ c : C, (Prod.map comul id) (comul c) = (Prod.map id comul) (comul c)
  counitLeft : ∀ c : C, (Prod.map counit id) (comul c) = (c, c)
  counitRight : ∀ c : C, (Prod.map id counit) (comul c) = (c, c)

structure BialgebraObject (B : Type u) extends MonoidObject B, ComonoidObject B where
  compatibility : ∀ a b : B, comul (mul a b) = (λ (x : B × B) (y : B × B) => (mul x.1 y.1, mul x.2 y.2)) (comul a) (comul b)
  unitIsCounit : counit unit = unit

structure HopfAlgebraObject (H : Type u) extends BialgebraObject H where
  antipode : H → H
  antipodeLeft : ∀ a : H, mul (antipode a) a = unit
  antipodeRight : ∀ a : H, mul a (antipode a) = unit

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse