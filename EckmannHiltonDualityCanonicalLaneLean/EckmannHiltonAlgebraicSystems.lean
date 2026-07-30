import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure AlgebraicSystem (M : Type u) where
  carrier : M
  multiplication : M → M → M
  unit : M
  associativity : Prop
  unitLeft : Prop
  unitRight : Prop
  multiplicationClosed : multiplication carrier unit = carrier ∧ multiplication unit carrier = carrier
  associativityTerm : associativity
  unitLeftTerm : unitLeft
  unitRightTerm : unitRight

structure AlgebraicSystemEvidence (M : Type u) (A : AlgebraicSystem M) where
  associativityClosed : A.associativity
  unitLeftClosed : A.unitLeft
  unitRightClosed : A.unitRight
  multiplicationClosed : A.multiplicationClosed

def AlgebraicSystemClosed (M : Type u) (A : AlgebraicSystem M) : Prop :=
  A.associativity ∧ A.unitLeft ∧ A.unitRight ∧ A.multiplicationClosed

theorem algebraic_system_closed_from_evidence (M : Type u) (A : AlgebraicSystem M)
    (E : AlgebraicSystemEvidence M A) : AlgebraicSystemClosed M A := by
  exact And.intro E.associativityClosed
    (And.intro E.unitLeftClosed
      (And.intro E.unitRightClosed E.multiplicationClosed))

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse