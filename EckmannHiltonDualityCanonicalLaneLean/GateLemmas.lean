import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse