import { Scene } from 'babylonjs';

export const _createScene = (engine) => {
  return new Scene(engine);
};

export const _render = (scene) => {
  return scene.render();
};

export const _setActiveCamera = (camera, scene) => {
  return scene.activeCamera = camera;
};

export const _getActiveCamera = (scene) => {
  return scene.activeCamera;
};