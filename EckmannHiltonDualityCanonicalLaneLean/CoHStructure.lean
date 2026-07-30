import EckmannHiltonDualityCanonicalLaneLean.MathlibObjects

/-!
# Co-H-Space Structure Package
-/

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure CoHStructure (X : EckmannHiltonSpace) where
  comultiplication : X.carrier → X.carrier × X.carrier
  counit : X.carrier → X.carrier
  coassociativity : Prop
  leftCounit : Prop
  rightCounit : Prop
  continuousCoMul : Prop

def CoHStructureClosed {X : EckmannHiltonSpace} (C : CoHStructure X) : Prop :=
  C.coassociativity ∧ C.leftCounit ∧ C.rightCounit

theorem coh_structure_closed_from_evidence {X : EckmannHiltonSpace} (C : CoHStructure X) : CoHStructureClosed C := by
  exact And.intro C.coassociativity (And.intro C.leftCounit C.rightCounit)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse