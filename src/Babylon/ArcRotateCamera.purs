module Babylon.ArcRotateCamera where

import Prelude

import Babylon.Camera (class Camera)
import Babylon.Scene (Scene)
import Babylon.Vector3 (Vector3)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn3, EffectFn7, runEffectFn3, runEffectFn7)
import Web.DOM (Element)

foreign import data ArcRotateCamera :: Type

foreign import _createArcRotateCamera :: EffectFn7 String Number Number Number Vector3 (Nullable Scene) (Nullable Boolean) ArcRotateCamera

createArcRotateCamera :: String -> Number -> Number -> Number -> Vector3 -> Maybe Scene -> Maybe Boolean -> Effect ArcRotateCamera
createArcRotateCamera id alpha beta radius target scene setActiveOnSceneIfNoneActive =
  runEffectFn7 _createArcRotateCamera id alpha beta radius target (toNullable scene) (toNullable setActiveOnSceneIfNoneActive)

foreign import _attachControl :: EffectFn3 Element Boolean ArcRotateCamera Unit

instance Camera ArcRotateCamera where
  attachControl = runEffectFn3 _attachControl