module Babylon.SceneLoader where

import Prelude

import Babylon.Scene (Scene)
import Control.Promise (Promise, toAff)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Uncurried (EffectFn5, runEffectFn5)

foreign import data ISceneLoaderProgressEvent :: Type

foreign import data ISceneLoaderAsyncResult :: Type

foreign import _importMeshAsync :: forall a. EffectFn5 a String (Nullable String) (Nullable Scene) (Nullable (ISceneLoaderProgressEvent -> Effect Unit)) (Promise ISceneLoaderAsyncResult)

importMeshAsync :: forall a. a -> String -> Maybe String -> Maybe Scene -> Maybe (ISceneLoaderProgressEvent -> Effect Unit) -> Aff ISceneLoaderAsyncResult
importMeshAsync meshesNames rootUrl sceneFilename scene onProgress = do
  promise <- liftEffect $ runEffectFn5 _importMeshAsync meshesNames rootUrl (toNullable sceneFilename) (toNullable scene) (toNullable onProgress)
  toAff promise
