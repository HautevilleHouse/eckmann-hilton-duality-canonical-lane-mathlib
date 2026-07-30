import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure MonoidObject (M : Type) where
  unit : M
  mul : M → M → M
  mul_assoc : ∀ a b c : M, mul (mul a b) c = mul a (mul b c)
  unit_left : ∀ a : M, mul unit a = a
  unit_right : ∀ a : M, mul a unit = a

structure MonoidCategory where
  carrier : Type
  monoid : MonoidObject carrier
  homSet : Type → Type → Type
  identity : ∀ (A : Type), homSet A A
  compose : ∀ (A B C : Type), homSet A B → homSet B C → homSet A C
  identity_left : ∀ (A B : Type) (f : homSet A B), compose A A B (identity A) f = f
  identity_right : ∀ (A B : Type) (f : homSet A B), compose A B B f (identity B) = f
  associativity : ∀ (A B C D : Type) (f : homSet A B) (g : homSet B C) (h : homSet C D),
    compose A C D (compose A B C f g) h = compose A B D f (compose B C D g h)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse
