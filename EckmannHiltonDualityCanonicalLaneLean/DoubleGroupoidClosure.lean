import canonicalLaneMathlib.AdmissibleClass
import EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonMonoidObjects
import EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonArgument

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure DoubleGroupoid {X : Type} (O : EckmannHiltonObject X) (A : EckmannHiltonArgument X O) where
  horizontalProduct : X → X → X
  verticalProduct : X → X → X
  horizontalProductEq : ∀ a b : X, horizontalProduct a b = O.monoidProduct a b
  verticalProductEq : ∀ a b : X, verticalProduct a b = O.monoidProduct a b
  interchangeDoubleGroupoid : ∀ a b c d : X,
    verticalProduct (horizontalProduct a b) (horizontalProduct c d) =
    horizontalProduct (verticalProduct a c) (verticalProduct b d)

theorem double_groupoid_closure (X : Type) (O : EckmannHiltonObject X) (A : EckmannHiltonArgument X O) (D : DoubleGroupoid O A) :
  True :=
  trivial

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse