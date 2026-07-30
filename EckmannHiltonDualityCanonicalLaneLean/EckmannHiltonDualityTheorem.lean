import canonicalLaneMathlib.AdmissibleClass
import EckmannHiltonDualityCanonicalLaneLean.EckmannHiltonDualityClosure

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

theorem eckmann_hilton_duality (M : Type u) [Mul M] [One M]
    (hH : ∀ x : M, x * 1 = x ∧ 1 * x = x)
    (hC : ∀ x : M, comul x = (x, x)) :
    ∀ x y : M, x * y = y * x := by
  intro x y
  have h1 : x = (x * 1) := by
    exact (hH x).1.symm
  have h2 : y = (1 * y) := by
    exact (hH y).2.symm
  calc
    x * y = (x * 1) * (1 * y) := by
      simp [h1, h2]
    _ = x * y := by
      simp
    _ = (1 * x) * (y * 1) := by
      simp [h1, h2]
    _ = y * x := by
      simp [h1, h2]

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse