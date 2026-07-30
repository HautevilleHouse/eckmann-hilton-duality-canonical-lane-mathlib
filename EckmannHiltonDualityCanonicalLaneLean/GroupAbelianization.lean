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
    calc
      mul' a b = mul' (mul' (h2.inv (h2.one)) (h2.one)) (mul' a b) := by
        simp [h2.one_mul, h2.mul_left_inv]
      _ = mul' (mul' (h2.inv (h2.one)) (h2.one)) (mul' a b) := rfl
      _ = mul' (h2.inv (h2.one)) (mul' (h2.one) (mul' a b)) := by symm; apply h2.mul_assoc
      _ = mul' (h2.inv (h2.one)) (mul' (mul' a b) (h2.one)) := by rw [h2.one_mul, h2.mul_one]
      _ = mul' (mul' (h2.inv (h2.one)) (mul' a b)) (h2.one) := by symm; apply h2.mul_assoc
      _ = mul' (mul' (mul' (h2.inv (h2.one)) a) b) (h2.one) := by
        rw [h2.mul_assoc]
      _ = mul' (mul' (h2.one) (mul' a b)) (h2.one) := by
        rw [h2.mul_left_inv (h2.one), h2.one_mul]
      _ = mul' (mul' a b) (h2.one) := by simp [h2.one_mul]
      _ = mul' a b := by simp [h2.mul_one]
  exact { h with mul_comm := mul_comm' }

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse