import { Engine } from 'babylonjs';

export const _createEngine = (canvas, antialias) => {
  return new Engine(canvas, antialias);
};

export const _runRenderLoop = (callback, engine) => {
  return engine.runRenderLoop(callback);
};

export const _resize = (engine) => {
  return engine.resize();
};