import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.MonoidCategory

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure BraidMonoid where
  strands : Nat
  braid : Type
  composition : MonoidObject braid
  braidRelation : Prop

structure BraidCategory where
  objects : Set Nat
  hom : Nat → Nat → Type
  compositionLaw : ∀ (n m p : Nat), hom n m → hom m p → hom n p
  identity : ∀ (n : Nat), hom n n
  associativity : ∀ (n m p q : Nat) (f : hom n m) (g : hom m p) (h : hom p q),
    compositionLaw n p q (compositionLaw n m p f g) h = compositionLaw n m q f (compositionLaw m p q g h)
  identityLeft : ∀ (n m : Nat) (f : hom n m), compositionLaw n n m (identity n) f = f
  identityRight : ∀ (n m : Nat) (f : hom n m), compositionLaw n m m f (identity m) = f

def braidMonoidFromCategory (B : BraidCategory) (n : Nat) : BraidMonoid := {
  strands := n
  braid := B.hom n n
  composition := {
    unit := B.identity n
    mul := B.compositionLaw n n n
    mul_assoc := by
      intro a b c
      exact B.associativity n n n n a b c
    unit_left := B.identityLeft n n
    unit_right := B.identityRight n n
  }
  braidRelation := sorry
}

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse
