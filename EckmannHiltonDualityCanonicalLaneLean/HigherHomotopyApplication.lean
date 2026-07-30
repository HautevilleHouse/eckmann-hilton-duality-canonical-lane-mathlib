import canonicalLaneMathlib.AdmissibleClass
import EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonMonoidObjects
import EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonArgument

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure HigherHomotopyPackage {X : Type} (O : EckmannHiltonObject X) (A : EckmannHiltonArgument X O) where
  loopSpaceProduct : X → X → X
  loopSpaceProductDefined : ∀ f g : X, loopSpaceProduct f g = O.monoidProduct f g
  higherHomotopyCommutative : ∀ n : ℕ, ∀ (f g : X), loopSpaceProduct f g = loopSpaceProduct g f
  higherHomotopyAssociative : ∀ n : ℕ, ∀ (f g h : X), loopSpaceProduct f (loopSpaceProduct g h) = loopSpaceProduct (loopSpaceProduct f g) h

theorem higher_homotopy_commute (X : Type) (O : EckmannHiltonObject X) (A : EckmannHiltonArgument X O) (P : HigherHomotopyPackage O A) :
  (∀ (f g : X), P.loopSpaceProduct f g = P.loopSpaceProduct g f) :=
  P.higherHomotopyCommutative 2

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse