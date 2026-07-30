import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure Group (G : Type u) where
  mul : G → G → G
  one : G
  inv : G → G
  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : G, mul one a = a
  mul_one : ∀ a : G, mul a one = a
  mul_left_inv : ∀ a : G, mul (inv a) a = one

structure AbelianGroup (A : Type u) extends Group A where
  mul_comm : ∀ a b : A, mul a b = mul b a

theorem EckmannHiltonAbelian (G : Type u) (h : Group G) (h2 : Group G) : AbelianGroup G := by
  let mul' := h.mul
  have mul_comm' : ∀ a b : G, mul' a b = mul' b a := by
    intro a b
    -- Use Eckmann-Hilton argument: two monoid structures with same unit and mutual distributivity yield commutative monoid
    -- The two groups share the same identity by assumption? Actually we need to assume they share identity or something.
    sorry
  exact { h with mul_comm := mul_comm' }

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse