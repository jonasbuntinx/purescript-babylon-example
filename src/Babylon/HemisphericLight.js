import { HemisphericLight } from 'babylonjs';

export const _createHemisphericLight = (id, position, scene) => {
  return new HemisphericLight(id, position, scene);
};
