module Babylon.HemisphericLight where

import Babylon.Scene (Scene)
import Babylon.Vector3 (Vector3)
import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3)

foreign import data HemisphericLight :: Type

foreign import _createHemisphericLight :: EffectFn3 String Vector3 Scene HemisphericLight

createHemisphericLight :: String -> Vector3 -> Scene -> Effect HemisphericLight
createHemisphericLight = runEffectFn3 _createHemisphericLight
