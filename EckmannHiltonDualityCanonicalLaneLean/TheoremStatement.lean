import EckmannHiltonDualityCanonicalLaneLean.BridgeLemmas
import Mathlib.Algebra.Group.Basic

/-!
# Theorem Statement Layer for Eckmann-Hilton Duality

This module defines the admitted object and witness closure for the Eckmann-Hilton
duality theorem.
-/

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EckmannHiltonSpace where
  carrier : Type
  operation : carrier → carrier → carrier
  unit : carrier
  associativity : ∀ a b c : carrier, operation (operation a b) c = operation a (operation b c)
  leftUnit : ∀ a : carrier, operation unit a = a
  rightUnit : ∀ a : carrier, operation a unit = a

structure EckmannHiltonAdmittedObject where
  space : EckmannHiltonSpace
  secondOperation : EckmannHiltonSpace
  interchange : ∀ a b c d : space.carrier,
    space.operation (secondOperation.operation a b) (secondOperation.operation c d) =
    secondOperation.operation (space.operation a c) (space.operation b d)
  unitsAgree : space.unit = secondOperation.unit
  conclusion : space.operation = secondOperation.operation

def EckmannHiltonWitnessClosed (O : EckmannHiltonAdmittedObject) : Prop :=
  O.conclusion

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse