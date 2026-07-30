import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonMonoidObjects

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

-- Eckmann-Hilton argument: two monoid structures on the same set with shared unit and interchange law yield a commutative monoid
structure InterchangeLaw {A : Type} (m1 : A → A → A) (m2 : A → A → A) (e : A) : Prop where
  unit_m1 : ∀ a : A, m1 e a = a ∧ m1 a e = a
  unit_m2 : ∀ a : A, m2 e a = a ∧ m2 a e = a
  interchange : ∀ a b c d : A, m1 (m2 a b) (m2 c d) = m2 (m1 a c) (m1 b d)

theorem eckmann_hilton_commutative {A : Type} (m1 m2 : A → A → A) (e : A)
  (I : InterchangeLaw m1 m2 e) : ∀ a b : A, m1 a b = m1 b a := by
  intro a b
  calc
    m1 a b = m1 (m2 e a) (m2 b e) := by
      simp [I.unit_m2, I.unit_m1]
    _ = m2 (m1 e b) (m1 a e) := by
      simpa using I.interchange e a b e
    _ = m2 b a := by
      simp [I.unit_m1, I.unit_m2]
    _ = m1 (m2 b e) (m2 e a) := by
      symm; simpa using I.interchange b e e a
    _ = m1 b a := by
      simp [I.unit_m2, I.unit_m1]

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse