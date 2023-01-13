import { CubeTexture } from 'babylonjs';

export const _createFromPrefilteredData = (url, scene) => {
  return CubeTexture.CreateFromPrefilteredData(url, scene);
};

export const _toString = (texture) => {
  return texture.toString();
};