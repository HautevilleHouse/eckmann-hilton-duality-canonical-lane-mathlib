import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure LoopDeloopPairing (X Y : Type u) where
  basepointPreserving : Prop
  coactionWithLoop : Prop
  deloopingMapWellDefined : Prop

structure LoopDeloopPairingEvidence (P : LoopDeloopPairing X Y) where
  basepointPreservingClosed : P.basepointPreserving
  coactionWithLoopClosed : P.coactionWithLoop
  deloopingMapWellDefinedClosed : P.deloopingMapWellDefined

def LoopDeloopPairingClosed (P : LoopDeloopPairing X Y) : Prop :=
  P.basepointPreserving ∧ P.coactionWithLoop ∧ P.deloopingMapWellDefined

theorem loop_deloop_pairing_closed_from_evidence (P : LoopDeloopPairing X Y)
  (E : LoopDeloopPairingEvidence P) : LoopDeloopPairingClosed P :=
  And.intro E.basepointPreservingClosed
    (And.intro E.coactionWithLoopClosed E.deloopingMapWellDefinedClosed)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse