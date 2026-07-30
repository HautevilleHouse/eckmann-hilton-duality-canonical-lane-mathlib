import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonTheorem

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

-- Algebraic structure for Eckmann-Hilton: a set with two binary operations satisfying interchange
structure EHPair (A : Type) where
  star : A → A → A
  circle : A → A → A
  unitStar : A
  unitCircle : A
  starUnitLeft : ∀ a : A, star unitStar a = a
  starUnitRight : ∀ a : A, star a unitStar = a
  circleUnitLeft : ∀ a : A, circle unitCircle a = a
  circleUnitRight : ∀ a : A, circle a unitCircle = a
  interchange : ∀ a b c d : A, star (circle a b) (circle c d) = circle (star a c) (star b d)

theorem eckmann_hilton_structures_equal {A : Type} (eh : EHPair A) : eh.star = eh.circle := by
  ext a b
  calc
    eh.star a b = eh.star (eh.circle eh.unitCircle a) (eh.circle b eh.unitCircle) := by
      simp [eh.circleUnitLeft, eh.circleUnitRight]
    _ = eh.circle (eh.star eh.unitCircle b) (eh.star a eh.unitCircle) := by
      simpa using eh.interchange eh.unitCircle a b eh.unitCircle
    _ = eh.circle b a := by
      simp [eh.starUnitLeft, eh.starUnitRight]
    _ = eh.star (eh.circle b eh.unitCircle) (eh.circle eh.unitCircle a) := by
      symm; simpa using eh.interchange b eh.unitCircle eh.unitCircle a
    _ = eh.star b a := by
      simp [eh.circleUnitRight, eh.circleUnitLeft]

theorem eckmann_hilton_commutative' {A : Type} (eh : EHPair A) : ∀ a b : A, eh.star a b = eh.star b a := by
  intro a b
  have h := eckmann_hilton_structures_equal eh
  have h' : ∀ a b : A, eh.circle a b = eh.circle b a := by
    intro a b
    calc
      eh.circle a b = eh.star a b := by rw [h]
      _ = eh.star (eh.circle eh.unitCircle a) (eh.circle b eh.unitCircle) := by
        simp [eh.circleUnitLeft, eh.circleUnitRight]
      _ = eh.circle (eh.star eh.unitCircle b) (eh.star a eh.unitCircle) := by
        simpa using eh.interchange eh.unitCircle a b eh.unitCircle
      _ = eh.circle b a := by
        simp [eh.starUnitLeft, eh.starUnitRight]
      _ = eh.star b a := by rw [h]
      _ = eh.star a b := by
        calc
          eh.star b a = eh.circle b a := by rw [h]
          _ = eh.circle a b := (calc
            eh.circle a b = eh.star a b := by rw [h]
            _ = eh.star (eh.circle eh.unitCircle a) (eh.circle b eh.unitCircle) := by
              simp [eh.circleUnitLeft, eh.circleUnitRight]
            _ = eh.circle (eh.star eh.unitCircle b) (eh.star a eh.unitCircle) := by
              simpa using eh.interchange eh.unitCircle a b eh.unitCircle
            _ = eh.circle b a := by
              simp [eh.starUnitLeft, eh.starUnitRight]).symm
        _ = eh.circle b a := rfl
      _ = eh.star b a := by rw [h]
  calc
    eh.star a b = eh.circle a b := by rw [h]
    _ = eh.circle b a := h' a b
    _ = eh.star b a := by rw [h]

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse