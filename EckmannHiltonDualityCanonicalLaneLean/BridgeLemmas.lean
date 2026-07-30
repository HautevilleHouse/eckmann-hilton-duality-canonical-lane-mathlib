import HautevilleHouse.EckmannHiltonDualityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.eckmannHiltonSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse