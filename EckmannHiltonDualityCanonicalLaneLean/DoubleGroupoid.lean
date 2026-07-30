import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure DoubleGroupoidPackage where
  horizontalGroupoid : Type u
  verticalGroupoid : Type v
  horizontalComp : horizontalGroupoid → horizontalGroupoid → horizontalGroupoid
  horizontalUnit : horizontalGroupoid
  horizontalAssoc : ∀ a b c : horizontalGroupoid, horizontalComp (horizontalComp a b) c = horizontalComp a (horizontalComp b c)
  horizontalUnitLeft : ∀ a : horizontalGroupoid, horizontalComp horizontalUnit a = a
  horizontalUnitRight : ∀ a : horizontalGroupoid, horizontalComp a horizontalUnit = a
  verticalComp : verticalGroupoid → verticalGroupoid → verticalGroupoid
  verticalUnit : verticalGroupoid
  verticalAssoc : ∀ a b c : verticalGroupoid, verticalComp (verticalComp a b) c = verticalComp a (verticalComp b c)
  verticalUnitLeft : ∀ a : verticalGroupoid, verticalComp verticalUnit a = a
  verticalUnitRight : ∀ a : verticalGroupoid, verticalComp a verticalUnit = a
  exchangeLaw : ∀ (h1 h2 : horizontalGroupoid) (v1 v2 : verticalGroupoid), horizontalComp h1 h2 = verticalComp v1 v2 → ?_

theorem double_groupoid_duality (D : DoubleGroupoidPackage) :
  ∀ h : D.horizontalGroupoid, ∀ v : D.verticalGroupoid, D.horizontalComp h h = D.verticalComp v v := by
  intro h v
  calc
    D.horizontalComp h h = D.horizontalComp h (D.horizontalComp D.horizontalUnit h) := by
      simp [D.horizontalUnitLeft]
    _ = D.horizontalComp (D.horizontalComp h D.horizontalUnit) h := by
      simp [D.horizontalAssoc]
    _ = D.horizontalComp h h := by
      simp [D.horizontalUnitRight]
    _ = D.verticalComp v v := ?_

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse