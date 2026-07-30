import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDuality

structure HigherHomotopyGroup (n : ℕ) (X : Type u) where
  carrier : Type v
  groupOperation : carrier → carrier → carrier
  identityElement : carrier
  inverseOperation : carrier → carrier
  associativity : ∀ a b c : carrier, groupOperation (groupOperation a b) c = groupOperation a (groupOperation b c)
  identityLeft : ∀ a : carrier, groupOperation identityElement a = a
  identityRight : ∀ a : carrier, groupOperation a identityElement = a
  inverseLeft : ∀ a : carrier, groupOperation (inverseOperation a) a = identityElement
  inverseRight : ∀ a : carrier, groupOperation a (inverseOperation a) = identityElement

def HigherHomotopyAbelian (n : ℕ) (X : Type u) (G : HigherHomotopyGroup n X) : Prop :=
  n ≥ 2 → ∀ a b : G.carrier, G.groupOperation a b = G.groupOperation b a

theorem higher_homotopy_abelian (n : ℕ) (X : Type u) (G : HigherHomotopyGroup n X) (hn : n ≥ 2) :
  ∀ a b : G.carrier, G.groupOperation a b = G.groupOperation b a := by
  intro a b
  exact (G.associativity a b a).symm.trans (G.associativity b a b)

end EckmannHiltonDuality
end HautevilleHouse
