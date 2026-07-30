import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

def ConstrainedEckmannHiltonClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_eckmann_hilton_endgame (A : AdmissibleClass) : ConstrainedEckmannHiltonClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse