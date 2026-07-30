import EckmannHiltonDualityCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EckmannHiltonDualityCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EckmannHiltonSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EckmannHiltonAdmittedObject where
  space : EckmannHiltonSpace
  hSpaceStructure : Prop
  hCogroupStructure : Prop
  compatibility : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homotopyGroupsComputed : Prop
  conclusion : homotopyGroupsComputed

structure EckmannHiltonEndgameState where
  object : EckmannHiltonAdmittedObject

def EckmannHiltonWitnessClosed (O : EckmannHiltonAdmittedObject) : Prop :=
  O.homotopyGroupsComputed

end EckmannHiltonDualityCanonicalLaneLean
end HautevilleHouse