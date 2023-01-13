module Babylon.Scene where

import Prelude

import Babylon.BaseTexture (class BaseTexture)
import Babylon.Camera (class Camera)
import Babylon.Engine (Engine)
import Babylon.Mesh (Mesh)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn4, EffectFn6, runEffectFn1, runEffectFn2, runEffectFn4, runEffectFn6)

foreign import data Scene :: Type

foreign import data ActiveCamera :: Type

foreign import _createScene :: EffectFn1 Engine Scene

createScene :: Engine -> Effect Scene
createScene = runEffectFn1 _createScene

foreign import _render :: EffectFn1 Scene Unit

render :: Scene -> Effect Unit
render = runEffectFn1 _render

foreign import _setActiveCamera :: forall a. EffectFn2 a Scene Unit

setActiveCamera :: forall a. Camera a => a -> Scene -> Effect Unit
setActiveCamera = runEffectFn2 _setActiveCamera

foreign import _getActiveCamera :: EffectFn1 Scene (Nullable ActiveCamera)

getActiveCamera :: Scene -> Effect (Maybe ActiveCamera)
getActiveCamera scene = toMaybe <$> runEffectFn1 _getActiveCamera scene

foreign import _createDefaultSkybox :: forall a. EffectFn6 a (Nullable Boolean) (Nullable Number) (Nullable Number) (Nullable Boolean) Scene (Nullable Mesh)

createDefaultSkybox :: forall a. BaseTexture a => a -> Maybe Boolean -> Maybe Number -> Maybe Number -> Maybe Boolean -> Scene -> Effect (Maybe Mesh)
createDefaultSkybox environmentTexture pbr scale blur setGlobalEnvTexture scene =
  toMaybe <$> runEffectFn6 _createDefaultSkybox environmentTexture (toNullable pbr) (toNullable scale) (toNullable blur) (toNullable setGlobalEnvTexture) scene

foreign import _createDefaultCameraOrLight :: EffectFn4 (Nullable Boolean) (Nullable Boolean) (Nullable Boolean) Scene Unit

createDefaultCameraOrLight :: Maybe Boolean -> Maybe Boolean -> Maybe Boolean -> Scene -> Effect Unit
createDefaultCameraOrLight createArcRotateCamera replace attachCameraControls scene =
  runEffectFn4 _createDefaultCameraOrLight (toNullable createArcRotateCamera) (toNullable replace) (toNullable attachCameraControls) scene
