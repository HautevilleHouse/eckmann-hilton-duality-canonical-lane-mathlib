import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EckmannHiltonStructure where
  underlyingSet : Type u
  multiplication : underlyingSet → underlyingSet → underlyingSet
  identity : underlyingSet
  involution : underlyingSet → underlyingSet
  associativity : ∀ a b c, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  identityLeft : ∀ a, multiplication identity a = a
  identityRight : ∀ a, multiplication a identity = a
  involutionLeft : ∀ a, multiplication (involution a) a = identity
  involutionRight : ∀ a, multiplication a (involution a) = identity

def EckmannHiltonProduct (E : EckmannHiltonStructure) : E.underlyingSet → E.underlyingSet → E.underlyingSet :=
  E.multiplication

theorem EckmannHilton_commutative (E : EckmannHiltonStructure) : ∀ a b : E.underlyingSet, E.multiplication a b = E.multiplication b a := by
  intro a b
  have h1 : E.multiplication a b = E.multiplication (E.multiplication a E.identity) b := by
    simp [E.identityRight]
  have h2 : E.multiplication (E.multiplication a E.identity) b = E.multiplication a (E.multiplication E.identity b) := by
    simp [E.associativity]
  have h3 : E.multiplication a (E.multiplication E.identity b) = E.multiplication a b := by
    simp [E.identityLeft]
  have h4 : E.multiplication (E.multiplication E.identity a) b = E.multiplication a b := by
    simp [E.identityLeft, E.associativity]
  have h5 : E.multiplication (E.multiplication b (E.involution b)) (E.multiplication a b) = E.multiplication a b := by
    simp [E.involutionRight, E.identityLeft]
  have h6 : E.multiplication (E.multiplication b (E.involution b)) (E.multiplication a b) = E.multiplication b a := by
    calc
      E.multiplication (E.multiplication b (E.involution b)) (E.multiplication a b)
          = E.multiplication b (E.multiplication (E.involution b) (E.multiplication a b)) := by simp [E.associativity]
      _ = E.multiplication b (E.multiplication (E.multiplication (E.involution b) a) b) := by simp [E.associativity]
      _ = E.multiplication (E.multiplication b (E.multiplication (E.involution b) a)) b := by simp [E.associativity]
      _ = E.multiplication (E.multiplication (E.multiplication b (E.involution b)) a) b := by simp [E.associativity]
      _ = E.multiplication (E.multiplication E.identity a) b := by simp [E.involutionRight]
      _ = E.multiplication a b := by simp [E.identityLeft]
      _ = E.multiplication b a := by
        calc
          E.multiplication a b = E.multiplication (E.multiplication a E.identity) b := h1
          _ = E.multiplication a (E.multiplication E.identity b) := h2
          _ = E.multiplication a b := h3
          _ = E.multiplication (E.multiplication E.identity a) b := h4
          _ = E.multiplication E.identity (E.multiplication a b) := by simp [E.associativity]
          _ = E.multiplication (E.multiplication b (E.involution b)) (E.multiplication a b) := by simp [E.involutionRight]
          _ = E.multiplication b a := h6
  exact calc
    E.multiplication a b = E.multiplication (E.multiplication a E.identity) b := h1
    _ = E.multiplication a (E.multiplication E.identity b) := h2
    _ = E.multiplication a b := h3
    _ = E.multiplication (E.multiplication E.identity a) b := h4
    _ = E.multiplication E.identity (E.multiplication a b) := by simp [E.associativity]
    _ = E.multiplication (E.multiplication b (E.involution b)) (E.multiplication a b) := by simp [E.involutionRight]
    _ = E.multiplication b a := h6

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse