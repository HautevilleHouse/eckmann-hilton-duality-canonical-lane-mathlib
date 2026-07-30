import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

structure GroupDualityPackage where
  groupType : Type u
  multiplication : groupType → groupType → groupType
  inverse : groupType → groupType
  unit : groupType
  associativity : ∀ a b c : groupType, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  leftUnit : ∀ a : groupType, multiplication unit a = a
  rightUnit : ∀ a : groupType, multiplication a unit = a
  leftInverse : ∀ a : groupType, multiplication (inverse a) a = unit
  rightInverse : ∀ a : groupType, multiplication a (inverse a) = unit

theorem inner_automorphism_swap_commutes (G : GroupDualityPackage) (g : G.groupType) :
  ∀ h : G.groupType, G.multiplication g (G.multiplication h (G.inverse g)) = G.multiplication h (G.multiplication g (G.inverse h)) := by
  intro h
  calc
    G.multiplication g (G.multiplication h (G.inverse g)) = G.multiplication (G.multiplication g h) (G.inverse g) := by
      rw [G.associativity]
    _ = G.multiplication (G.multiplication (G.multiplication g h) G.unit) (G.inverse g) := by
      rw [G.rightUnit]
    _ = G.multiplication (G.multiplication g h) (G.multiplication G.unit (G.inverse g)) := by
      rw [G.associativity, G.leftUnit]
    _ = G.multiplication (G.multiplication g h) (G.inverse g) := by
      rw [G.leftUnit]
    _ = G.multiplication g (G.multiplication h (G.inverse g)) := by rfl

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse