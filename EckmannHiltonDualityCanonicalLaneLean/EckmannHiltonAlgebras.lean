import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDuality

structure EckmannHiltonAlgebra (M : Type u) where
  unit : M
  mult : M → M → M
  commutativity : ∀ a b : M, mult a b = mult b a
  associativity : ∀ a b c : M, mult (mult a b) c = mult a (mult b c)
  identity : ∀ a : M, mult unit a = a ∧ mult a unit = a
  inversion : ∀ a : M, ∃ b : M, mult a b = unit ∧ mult b a = unit

def EckmannHiltonAlgebraClosed (A : EckmannHiltonAlgebra M) : Prop :=
  A.commutativity ∧ A.associativity ∧ A.identity ∧ A.inversion

end EckmannHiltonDuality
end HautevilleHouse
