import * as THREE from "three"

import vertex from "../../glsl/planeVertex.glsl"
import fragment from "../../glsl/planeFragment.glsl"



export class OilFuildRenderer {
  private _scene
  private _target
  private _camera
  private _uniforms

  constructor() {
    this._scene = new THREE.Scene()
    this._target = new THREE.WebGLRenderTarget(window.innerWidth, window.innerHeight);

    this._uniforms = {
      u_time: { value: 0 },
      u_resolution: {
        value: new THREE.Vector2()
      },
      u_texture: { value: this._target.texture }
    }

    const frustumSize = window.innerHeight;
    const aspect = window.innerWidth / window.innerHeight;
    this._camera = new THREE.OrthographicCamera(
      frustumSize * aspect / -2,
      frustumSize * aspect / 2,
      frustumSize / 2,
      frustumSize / -2,
      -1000,
      1000
    );
    this._camera.position.set(0, 0, 2);

    this._createMesh()
  }


  _createMesh() {
    const size = 64;
    const geometry = new THREE.PlaneGeometry(size, size);
    const material = new THREE.ShaderMaterial({
      vertexShader: vertex,
      fragmentShader: fragment,
      uniforms: this._uniforms
    })
  }


}