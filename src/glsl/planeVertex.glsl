varying vec2 vUv;

void main(){
 vUv = uv;

  vec4 mvPosition = modelViewMatrix * vec4(position,1.0);

  vec4 finalPosition = projectionMatrix * mvPosition;
  gl_Position =vec4(finalPosition);
}