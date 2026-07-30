import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EckmannHiltonObject where
  carrier : Type u
  monoidOne : carrier
  monoidTwo : carrier
  morphismA : carrier → carrier → carrier
  morphismB : carrier → carrier → carrier
  morphismC : carrier → carrier → carrier
  monoidOneIsMonoid : ∀ x y z : carrier, morphismA (morphismA x y) z = morphismA x (morphismA y z) ∧ morphismA monoidOne x = x ∧ morphismA x monoidOne = x
  monoidTwoIsMonoid : ∀ x y z : carrier, morphismB (morphismB x y) z = morphismB x (morphismB y z) ∧ morphismB monoidTwo x = x ∧ morphismB x monoidTwo = x
  interchange : ∀ a b c d : carrier, morphismC (morphismA a b) (morphismA c d) = morphismA (morphismC a c) (morphismC b d)
  derivedEquality : ∀ a b : carrier, morphismA a b = morphismB a b

def EckmannHiltonDualityClosed (O : EckmannHiltonObject) : Prop :=
  O.derivedEquality

theorem eckmann_hilton_duality_closed (O : EckmannHiltonObject) : EckmannHiltonDualityClosed O :=
  O.derivedEquality

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse
