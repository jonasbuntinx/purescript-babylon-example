import { SceneLoader } from 'babylonjs';

import 'babylonjs-loaders';

export const _importMeshAsync = (meshNames, rootUrl, sceneFilename, scene, onProgress) => {
  return SceneLoader.ImportMeshAsync(meshNames, rootUrl, sceneFilename, scene, onProgress);
};

export const _appendAsync = (rootUrl, sceneFilename, scene, onProgress) => {
  return SceneLoader.AppendAsync(rootUrl, sceneFilename, scene, onProgress);
};