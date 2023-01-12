module Babylon.Vector3 where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3)

foreign import data Vector3 :: Type

foreign import _createVector3 :: EffectFn3 (Nullable Number) (Nullable Number) (Nullable Number) Vector3

createVector3 :: Maybe Number -> Maybe Number -> Maybe Number -> Effect Vector3
createVector3 x y z = runEffectFn3 _createVector3 (toNullable x) (toNullable y) (toNullable z)