module Babylon.Camera where

import Prelude

import Effect (Effect)
import Web.DOM (Element)

class Camera a where
  attachControl :: Element -> Boolean -> a -> Effect Unit

