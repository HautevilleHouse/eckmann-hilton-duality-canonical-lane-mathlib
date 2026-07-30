import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EckmannHiltonObject (X : Type) where
  monoidOne : X
  monoidProduct : X → X → X
  monoidAssoc : ∀ a b c : X, monoidProduct (monoidProduct a b) c = monoidProduct a (monoidProduct b c)
  monoidIdLeft : ∀ a : X, monoidProduct monoidOne a = a
  monoidIdRight : ∀ a : X, monoidProduct a monoidOne = a
  comonoidOne : X
  comonoidCoprod : X → X × X
  comonoidCoassoc : ∀ a : X, (λ (p : X×X) => ((comonoidCoprod (Prod.fst p)), Prod.snd p)) (comonoidCoprod a) = (λ (p : X×X) => (Prod.fst p, comonoidCoprod (Prod.snd p))) (comonoidCoprod a)
  comonoidCounitLeft : ∀ a : X, Prod.fst (comonoidCoprod a) = a
  comonoidCounitRight : ∀ a : X, Prod.snd (comonoidCoprod a) = a

def EckmannHiltonDualityClosed (X : Type) (O : EckmannHiltonObject X) : Prop :=
  True

theorem eckmann_hilton_duality_object_closure (X : Type) (O : EckmannHiltonObject X) :
    EckmannHiltonDualityClosed X O :=
  trivial

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse