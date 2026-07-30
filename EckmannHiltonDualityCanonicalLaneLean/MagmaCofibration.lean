import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure MagmaCofibration (X : Type u) where
  theta : X → X → X
  idempotentCenter : Prop
  coassociativeForm : Prop
  centerDistinguished : X

structure MagmaCofibrationEvidence (M : MagmaCofibration X) where
  idempotentCenterClosed : M.idempotentCenter
  coassociativeFormClosed : M.coassociativeForm

def MagmaCofibrationClosed (M : MagmaCofibration X) : Prop :=
  M.idempotentCenter ∧ M.coassociativeForm

theorem magma_cofibration_closed_from_evidence (M : MagmaCofibration X) 
  (E : MagmaCofibrationEvidence M) : MagmaCofibrationClosed M := 
  And.intro E.idempotentCenterClosed E.coassociativeFormClosed

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse