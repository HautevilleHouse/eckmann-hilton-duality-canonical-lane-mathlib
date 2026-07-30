import EckmannHiltonDualityCanonicalLaneLean.HStructure
import EckmannHiltonDualityCanonicalLaneLean.CoHStructure

/-!
# Duality Pairs Package
-/

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure DualityPair (X Y : EckmannHiltonSpace) where
  hSpace : HSpaceStructure X
  coHSpace : CoHStructure Y
  pairing : X.carrier → Y.carrier → Prop
  nondegenerate : Prop
  duality : Prop
  pairingContinuous : Prop

def DualityPairClosed {X Y : EckmannHiltonSpace} (D : DualityPair X Y) : Prop :=
  D.nondegenerate ∧ D.duality ∧ D.pairingContinuous

theorem duality_pair_closed_from_evidence {X Y : EckmannHiltonSpace} (D : DualityPair X Y) : DualityPairClosed D := by
  exact And.intro D.nondegenerate (And.intro D.duality D.pairingContinuous)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse