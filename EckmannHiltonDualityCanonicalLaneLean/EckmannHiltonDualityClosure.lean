import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

def EckmannHiltonClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem eckmann_hilton_endgame (A : AdmissibleClass) :
    EckmannHiltonClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse