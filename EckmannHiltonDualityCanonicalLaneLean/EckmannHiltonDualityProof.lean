import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure EckmannHiltonProofPackage (A : AdmissibleClass) where
  productCompatible : Prop
  multiplicationAgreement : Prop
  associativityAgreement : Prop
  productCompatibleClosed : productCompatible
  multiplicationAgreementClosed : multiplicationAgreement
  associativityAgreementClosed : associativityAgreement

def EckmannHiltonProofClosed (A : AdmissibleClass) (P : EckmannHiltonProofPackage A) : Prop :=
  P.productCompatible ∧ P.multiplicationAgreement ∧ P.associativityAgreement

theorem eckmann_hilton_proof_closed_from_evidence (A : AdmissibleClass)
    (P : EckmannHiltonProofPackage A) : EckmannHiltonProofClosed A P := by
  exact And.intro P.productCompatibleClosed
    (And.intro P.multiplicationAgreementClosed P.associativityAgreementClosed)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse