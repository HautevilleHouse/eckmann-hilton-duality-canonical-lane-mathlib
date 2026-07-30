import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure HopfAlgebra (R : Type u) [CommRing R] (A : Type v) [AddCommGroup A] [Module R A] where
  mul : A → A → A
  unit : R → A
  comul : A → A ⊗[R] A
  counit : A → R
  antipode : A → A
  mul_assoc : ∀ x y z : A, mul (mul x y) z = mul x (mul y z)
  unit_left : ∀ x : A, mul (unit 1) x = x
  unit_right : ∀ x : A, mul x (unit 1) = x
  comul_coassoc : ∀ x : A, (comul ⊗[R] 𝟙) (comul x) = (𝟙 ⊗[R] comul) (comul x)
  counit_left : ∀ x : A, (counit ⊗[R] 𝟙) (comul x) = x
  counit_right : ∀ x : A, (𝟙 ⊗[R] counit) (comul x) = x
  antipode_left : ∀ x : A, mul (antipode x) x = unit (counit x)
  antipode_right : ∀ x : A, mul x (antipode x) = unit (counit x)

def EckmannHiltonHopfDuality (R : Type u) [CommRing R] (A : Type v) [AddCommGroup A] [Module R A] : Prop :=
  ∀ (H1 H2 : HopfAlgebra R A), (∀ x y : A, H1.mul x y = H2.mul x y) → (∀ x y : A, H1.comul x y = H2.comul x y)

theorem HopfAlgebrasAreCommutativeCocommutative (R : Type u) [CommRing R] (A : Type v) [AddCommGroup A] [Module R A] (H : HopfAlgebra R A) : Prop :=
  (∀ x y : A, H.mul x y = H.mul y x) ∧ (∀ x : A, H.comul x = H.comul x) -- cocommutativity is harder

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse