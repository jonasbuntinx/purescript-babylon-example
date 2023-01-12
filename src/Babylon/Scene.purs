module Babylon.Scene where

import Prelude

import Babylon.Camera (class Camera)
import Babylon.Engine (Engine)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)

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
getActiveCamera scene = toMaybe <$> (runEffectFn1 _getActiveCamera scene)

