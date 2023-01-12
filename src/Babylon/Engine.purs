module Babylon.Engine where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Web.DOM (Element)

foreign import data Engine :: Type

foreign import _createEngine :: EffectFn2 Element Boolean Engine

createEngine :: Element -> Boolean -> Effect Engine
createEngine = runEffectFn2 _createEngine

foreign import _runRenderLoop :: EffectFn2 (Effect Unit) Engine Unit

runRenderLoop :: Effect Unit -> Engine -> Effect Unit
runRenderLoop = runEffectFn2 _runRenderLoop

foreign import _resize :: EffectFn1 Engine Unit

resize :: Engine -> Effect Unit
resize = runEffectFn1 _resize