import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EckmannHiltonStrictification (M : MagmaCofibration X) where
  strictCommutation : Prop
  strictAssociativity : Prop
  deformationRetract : M.coassociativeForm → strictAssociativity
  commDerivedFromCoaction : M.idempotentCenter → strictCommutation

structure EckmannHiltonStrictificationEvidence (S : EckmannHiltonStrictification M) where
  strictCommutationClosed : S.strictCommutation
  strictAssociativityClosed : S.strictAssociativity

def EckmannHiltonStrictificationClosed (S : EckmannHiltonStrictification M) : Prop :=
  S.strictCommutation ∧ S.strictAssociativity

theorem eckmann_hilton_strictification_closed_from_evidence
  (S : EckmannHiltonStrictification M) (E : EckmannHiltonStrictificationEvidence S) :
  EckmannHiltonStrictificationClosed S :=
  And.intro E.strictCommutationClosed E.strictAssociativityClosed

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse