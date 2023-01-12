import { ArcRotateCamera } from 'babylonjs';

export const _createArcRotateCamera = (id, alpha, beta, radius, target, scene, setActiveOnSceneIfNoneActive) => {
  return new ArcRotateCamera(id, alpha, beta, radius, target, scene, setActiveOnSceneIfNoneActive);
};

export const _attachControl = (canvas, noPreventDefault, camera) => {
  return camera.attachControl(canvas, noPreventDefault);
};