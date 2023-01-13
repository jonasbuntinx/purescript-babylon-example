module Babylon.BaseTexture where

import Effect (Effect)

class BaseTexture a where
  toString :: a -> Effect String

