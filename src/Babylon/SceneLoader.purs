module Babylon.SceneLoader where

import Prelude

import Babylon.Scene (Scene)
import Control.Promise (Promise, toAff)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Uncurried (EffectFn4, EffectFn5, runEffectFn4, runEffectFn5)

foreign import data ISceneLoaderProgressEvent :: Type

foreign import data ISceneLoaderAsyncResult :: Type

foreign import _importMeshAsync :: forall a. EffectFn5 a String (Nullable String) (Nullable Scene) (Nullable (ISceneLoaderProgressEvent -> Effect Unit)) (Promise ISceneLoaderAsyncResult)

importMeshAsync :: forall a. a -> String -> Maybe String -> Maybe Scene -> Maybe (ISceneLoaderProgressEvent -> Effect Unit) -> Aff ISceneLoaderAsyncResult
importMeshAsync meshesNames rootUrl sceneFilename scene onProgress =
  toAff <=< liftEffect $ runEffectFn5 _importMeshAsync meshesNames rootUrl (toNullable sceneFilename) (toNullable scene) (toNullable onProgress)

foreign import _appendAsync :: EffectFn4 String (Nullable String) (Nullable Scene) (Nullable (ISceneLoaderProgressEvent -> Effect Unit)) (Promise Scene)

appendAsync :: String -> Maybe String -> Maybe Scene -> Maybe (ISceneLoaderProgressEvent -> Effect Unit) -> Aff Scene
appendAsync rootUrl sceneFilename scene onProgress =
  toAff <=< liftEffect $ runEffectFn4 _appendAsync rootUrl (toNullable sceneFilename) (toNullable scene) (toNullable onProgress)

