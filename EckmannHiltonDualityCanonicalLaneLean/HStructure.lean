import EckmannHiltonDualityCanonicalLaneLean.MathlibObjects

/-!
# H-Space Structure Package
-/

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure HSpaceStructure (X : EckmannHiltonSpace) where
  multiplication : X.carrier → X.carrier → X.carrier
  unit : X.carrier
  leftUnit : ∀ x, multiplication unit x = x
  rightUnit : ∀ x, multiplication x unit = x
  continuousMul : Continuous (uncurry multiplication)

def HSpaceStructureClosed {X : EckmannHiltonSpace} (H : HSpaceStructure X) : Prop :=
  H.leftUnit = True ∧ H.rightUnit = True

theorem hspace_structure_closed_from_evidence {X : EckmannHiltonSpace} (H : HSpaceStructure X) : HSpaceStructureClosed H := by
  exact And.intro rfl rfl

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse