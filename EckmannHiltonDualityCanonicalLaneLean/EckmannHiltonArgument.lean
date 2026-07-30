import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EckmannHiltonData (M : Type u) where
  mul1 : M → M → M
  mul2 : M → M → M
  unit : M
  unitLeft_mul1 : ∀ a : M, mul1 unit a = a
  unitRight_mul1 : ∀ a : M, mul1 a unit = a
  unitLeft_mul2 : ∀ a : M, mul2 unit a = a
  unitRight_mul2 : ∀ a : M, mul2 a unit = a
  interchange : ∀ a b c d : M, mul1 (mul2 a b) (mul2 c d) = mul2 (mul1 a c) (mul1 b d)

theorem eckmann_hilton_eq (M : Type u) (d : EckmannHiltonData M) : ∀ a b : M, d.mul1 a b = d.mul2 a b := by
  intro a b
  calc
    d.mul1 a b = d.mul1 (d.mul2 a d.unit) (d.mul2 d.unit b) := by
      simp [d.unitRight_mul2, d.unitLeft_mul2]
    _ = d.mul2 (d.mul1 a d.unit) (d.mul1 d.unit b) := by rw [d.interchange]
    _ = d.mul2 a b := by simp [d.unitRight_mul1, d.unitLeft_mul1]

theorem eckmann_hilton_comm (M : Type u) (d : EckmannHiltonData M) : ∀ a b : M, d.mul1 a b = d.mul1 b a := by
  intro a b
  have h_eq : d.mul1 a b = d.mul2 a b := eckmann_hilton_eq M d a b
  have h_eq' : d.mul1 b a = d.mul2 b a := eckmann_hilton_eq M d b a
  calc
    d.mul1 a b = d.mul2 a b := h_eq
    _ = d.mul2 (d.mul1 d.unit a) (d.mul1 b d.unit) := by simp [d.unitLeft_mul1, d.unitRight_mul1]
    _ = d.mul1 (d.mul2 d.unit b) (d.mul2 a d.unit) := by rw [d.interchange]
    _ = d.mul1 b a := by simp [d.unitLeft_mul2, d.unitRight_mul2]
    _ = d.mul2 b a := h_eq'
    _ = d.mul2 a b := by
      -- need to show mul2 is commutative; from equality of mul1 and mul2, mul1 commutative implies mul2 commutative
      have h_comm1 : ∀ x y : M, d.mul1 x y = d.mul1 y x := by
        intro x y
        -- from the previous equality, we already have mul1 = mul2, but to avoid circularity we use the statement we are proving for x,y
        -- Actually we can use the same reasoning as above for x,y
        calc
          d.mul1 x y = d.mul2 x y := eckmann_hilton_eq M d x y
          _ = d.mul2 (d.mul1 d.unit x) (d.mul1 y d.unit) := by simp [d.unitLeft_mul1, d.unitRight_mul1]
          _ = d.mul1 (d.mul2 d.unit y) (d.mul2 x d.unit) := by rw [d.interchange]
          _ = d.mul1 y x := by simp [d.unitLeft_mul2, d.unitRight_mul2]
      exact h_comm1 a b
    _ = d.mul1 b a := by symm; exact h_eq'

theorem eckmann_hilton_assoc (M : Type u) (d : EckmannHiltonData M) : ∀ a b c : M, d.mul1 (d.mul1 a b) c = d.mul1 a (d.mul1 b c) := by
  intro a b c
  have h_eq : ∀ x y, d.mul1 x y = d.mul2 x y := eckmann_hilton_eq M d
  -- using that mul2 is associative because it comes from a monoid? but we don't have that. We have interchange and units.
  -- Actually the Eckmann-Hilton argument shows both operations are equal and commutative, but associativity requires the interchange law and units.
  -- Proof: (a*b)*c = (a*b)*c = (a*1)*(b*c) ???
  -- Standard proof: (a*b)*c = (a*b)*(1*c) = (a*1)*(b*c) = a*(b*c)
  calc
    d.mul1 (d.mul1 a b) c = d.mul2 (d.mul1 a b) c := by rw [h_eq]
    _ = d.mul2 (d.mul1 a b) (d.mul1 d.unit c) := by simp [d.unitLeft_mul1]
    _ = d.mul1 (d.mul2 a d.unit) (d.mul2 b c) := by rw [d.interchange]
    _ = d.mul1 a (d.mul2 b c) := by simp [d.unitRight_mul2]
    _ = d.mul1 a (d.mul1 b c) := by rw [h_eq]

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse