import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.AlgebraicGeometry.EllipticCurve.Projective.Point
import Mathlib.Algebra.Group.Subgroup.Basic

namespace FormalIsogeny
universe u

variable {F : Type u} [Field F]

-- Geometrically morphism
-- is_regular is implåemented as homomogeneous formula
structure WeierstrassCurveMorphism (W_1 W_2 : WeierstrassCurve F)
where
  toFun : W_1.toProjective.Point → W_2.toProjective.Point
  is_regular : Prop

instance {W_1 W_2 : WeierstrassCurve F} :
  CoeFun (WeierstrassCurveMorphism (F := F) W_1 W_2)
  (
    fun _ =>
      W_1.toProjective.Point →
      W_2.toProjective.Point
  ) where
  coe φ := φ.toFun

structure Isogeny (W_1 W_2 : WeierstrassCurve F) extends WeierstrassCurveMorphism (F := F) W_1 W_2
where
  map_zero : toFun 0 = 0
  nonconstant: ∃ P Q: WeierstrassCurve.Projective.Point W_1,
    P ≠ Q ∧ toFun P ≠ toFun Q


end FormalIsogeny
