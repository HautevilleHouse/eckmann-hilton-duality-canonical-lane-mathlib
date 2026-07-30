import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonArgument

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure HSpace (X : Type u) [TopologicalSpace X] where
  basepoint : X
  multiplication : X → X → X
  homotopyUnit : ∀ x : X, multiplication basepoint x = x ∧ multiplication x basepoint = x

structure HGroup (X : Type u) [TopologicalSpace X] extends HSpace X where
  inverse : X → X
  homotopyInverse : ∀ x : X, multiplication x (inverse x) = basepoint ∧ multiplication (inverse x) x = basepoint

structure LoopSpace (X : Type u) [TopologicalSpace X] (x0 : X) where
  loops : Type u
  basepointLoop : loops
  concatenation : loops → loops → loops
  reverse : loops → loops
  -- etc.

structure HigherHomotopyGroup (X : Type u) [TopologicalSpace X] (x0 : X) (n : ℕ) where
  elements : Type u
  groupOperations : HGroup elements

-- The Eckmann-Hilton argument shows that for n ≥ 2, the higher homotopy groups are abelian.
theorem higher_homotopy_abelian (X : Type u) [TopologicalSpace X] (x0 : X) (n : ℕ) (hn : n ≥ 2) :
  ∀ (G : HigherHomotopyGroup X x0 n), 
    (∀ a b : G.elements, G.groupOperations.multiplication a b = G.groupOperations.multiplication b a) := by
  intro G a b
  -- This would use the Eckmann-Hilton argument on the two concatenation operations
  sorry

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse