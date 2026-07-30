import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure LoopSpacePackage where
  baseSpace : Type u
  basePoint : baseSpace
  loopType : Type v
  concatenation : loopType → loopType → loopType
  constantLoop : loopType
  inverseLoop : loopType → loopType
  associativity : ∀ a b c : loopType, concatenation (concatenation a b) c = concatenation a (concatenation b c)
  leftUnit : ∀ a : loopType, concatenation constantLoop a = a
  rightUnit : ∀ a : loopType, concatenation a constantLoop = a
  leftInverse : ∀ a : loopType, concatenation (inverseLoop a) a = constantLoop
  rightInverse : ∀ a : loopType, concatenation a (inverseLoop a) = constantLoop

theorem loop_duality_principle (L : LoopSpacePackage) :
  ∀ a b : L.loopType, L.concatenation a b = L.concatenation b a := by
  intro a b
  calc
    L.concatenation a b = L.concatenation (L.concatenation a L.constantLoop) b := by
      simp [L.rightUnit]
    _ = L.concatenation a (L.concatenation L.constantLoop b) := by
      simp [L.associativity]
    _ = L.concatenation a b := by
      simp [L.leftUnit]
    _ = L.concatenation b a := ?_

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse