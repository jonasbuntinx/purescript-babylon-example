module Babylon.CubeTexture where

import Babylon.BaseTexture (class BaseTexture)
import Babylon.Scene (Scene)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)

foreign import data CubeTexture :: Type

foreign import _createFromPrefilteredData :: EffectFn2 String Scene CubeTexture

createFromPrefilteredData :: String -> Scene -> Effect CubeTexture
createFromPrefilteredData = runEffectFn2 _createFromPrefilteredData

foreign import _toString :: EffectFn1 CubeTexture String

instance BaseTexture CubeTexture where
  toString = runEffectFn1 _toString