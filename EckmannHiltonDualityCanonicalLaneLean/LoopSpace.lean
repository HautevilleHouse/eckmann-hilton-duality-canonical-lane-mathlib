import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDuality

structure LoopSpace (X : Type u) (x0 : X) where
  loops : Set (Set (Path x0 x0))
  composition : loops → loops → loops
  identity : loops
  associativity : ∀ f g h : loops, composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ f : loops, composition identity f = f
  identityRight : ∀ f : loops, composition f identity = f

def LoopSpaceAbelian (X : Type u) (x0 : X) (Ω : LoopSpace X x0) : Prop :=
  ∀ f g : Ω.loops, Ω.composition f g = Ω.composition g f

theorem loop_space_abelian (X : Type u) (x0 : X) (Ω : LoopSpace X x0) : LoopSpaceAbelian X x0 Ω := by
  intro f g
  exact Ω.associativity f g f

end EckmannHiltonDuality
end HautevilleHouse
