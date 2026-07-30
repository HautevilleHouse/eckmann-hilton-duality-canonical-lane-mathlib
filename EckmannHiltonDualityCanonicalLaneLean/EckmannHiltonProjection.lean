import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

def eckmannHiltonProjection : Projection EndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem eckmann_hilton_projection_idempotent (x : EndgameState) :
    eckmannHiltonProjection.toFun (eckmannHiltonProjection.toFun x) = eckmannHiltonProjection.toFun x := by
  exact eckmannHiltonProjection.idempotent x

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse