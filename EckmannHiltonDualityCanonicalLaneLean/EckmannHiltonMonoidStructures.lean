import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure MonoidStructure (M : Type u) where
  multiplication : M → M → M
  unit : M
  multiplicationClosed : ∀ x y : M, multiplication x y = multiplication x y
  unitLeft : ∀ x : M, multiplication unit x = x
  unitRight : ∀ x : M, multiplication x unit = x
  associativity : ∀ x y z : M, multiplication (multiplication x y) z = multiplication x (multiplication y z)

def MonoidStructureClosed (M : Type u) (S : MonoidStructure M) : Prop :=
  S.unitLeft ∧ S.unitRight ∧ S.associativity

theorem monoid_structure_closed (M : Type u) (S : MonoidStructure M) : MonoidStructureClosed M S := by
  exact And.intro S.unitLeft (And.intro S.unitRight S.associativity)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse