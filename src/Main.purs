module Main where

import Prelude

import Babylon.ArcRotateCamera (createArcRotateCamera) as ArcRotateCamera
import Babylon.Camera (attachControl)
import Babylon.Engine (createEngine, resize, runRenderLoop) as Engine
import Babylon.HemisphericLight (createHemisphericLight) as HemisphericLight
import Babylon.Scene (createScene, render, getActiveCamera) as Scene
import Babylon.SceneLoader (importMeshAsync) as SceneLoader
import Babylon.Vector3 (createVector3) as Vector3
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Number (pi)
import Effect (Effect)
import Effect.Aff (runAff_)
import Effect.Console as Console
import Effect.Exception as Exception
import Web.DOM.NonElementParentNode (getElementById)
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document, toEventTarget)

main :: Effect Unit
main = do
  -- Get the canvas element
  element <- getElementById "babylon" =<< (map toNonElementParentNode $ document =<< window)
  case element of
    Nothing -> Exception.throw "Babylon render canvas not found."
    Just canvas -> do
      -- Generate the BABYLON 3D engine
      engine <- Engine.createEngine canvas true

      -- Create scene
      scene <- Scene.createScene engine

      -- Import Mesh (async)
      runAff_
        ( case _ of
            Right _ -> Console.debug "Import mesh succesful"
            Left err -> Console.debugShow err
        ) $ SceneLoader.importMeshAsync "" "https://assets.babylonjs.com/meshes/" (Just "box.babylon") (Just scene) Nothing

      -- Create Camera
      target <- Vector3.createVector3 (Just 0.0) (Just 0.0) (Just 0.0)
      camera <- ArcRotateCamera.createArcRotateCamera "camera" (-pi / 2.0) (pi / 2.5) 15.0 target (Just scene) (Just true)

      -- Attach camera input controls to the canvas
      attachControl canvas true camera

      -- Create Light
      direction <- Vector3.createVector3 (Just 1.0) (Just 1.0) (Just 0.0)
      _ <- HemisphericLight.createHemisphericLight "light" direction scene

      -- Register a render loop to repeatedly render the scene
      Engine.runRenderLoop
        ( do
            -- Check if there is an active camera
            activeCamera <- Scene.getActiveCamera scene
            case activeCamera of
              Nothing -> pure unit
              Just _ -> Scene.render scene
        )
        engine

      -- Watch for browser/canvas resize event
      listener <- eventListener \_ -> Engine.resize engine
      addEventListener (EventType "resize") listener true =<< map toEventTarget window

