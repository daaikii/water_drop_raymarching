uniform float u_time;
uniform vec2 u_resolution;
uniform sampler2D u_texture;
varying vec2 vUv; 

// int octaves = 8;
// float seed = 155.55;

// vec4 getTexture(sampler2D baseTexture){
//   return texture2D(baseTexture,vUv);
// } 

//   //整数単位の座標から延びるランダムなgradient vectorの作成
// vec2 random (vec2 st,float seed){
//   st = vec2(
//     dot(st,vec2(155,255)),
//     dot(st,vec2(255,155))
//   );
//   return -1.0 + 2.0*fract(sin(st)*seed);
// }



// float noise (in vec2 st,in float seed){
//   //整数単位の座標を取得
//   vec2 ipos = floor(st);

//   //小数単位の座標を取得
//   vec2 fpos = fract(st);
  
//   //補完するための処理
//   vec2 u = fpos*fpos*(3.0-2.0*fpos);

//   //整数単位のベクトルから勾配ベクトルを作成
//   vec2 ga = random(ipos + vec2(0.0,0.0),seed);
//   vec2 gb = random(ipos + vec2(1.0,0.0),seed);
//   vec2 gc = random(ipos + vec2(0.0,1.0),seed);
//   vec2 gd = random(ipos + vec2(1.0,1.0),seed);

//   //勾配ベクトルと距離ベクトルの内積を求める。
//   //dotの第二引数でピクセルから近くの整数座標までの距離ベクトルを取得。
//   float va = dot(ga,(fpos - vec2(0.0,0.0)));
//   float vb = dot(gb,(fpos - vec2(1.0,0.0)));
//   float vc = dot(gc,(fpos - vec2(0.0,1.0)));
//   float vd = dot(gd,(fpos - vec2(1.0,1.0)));

//   //4つの内積の平均を取得
//  return mix( 
//     mix( va, vb, u.x),
//     mix( vc,vc , u.x), 
//   u.y);
// }



// float fbm(in vec2 _st, float seed) {
//   float v = 0.0;
//   float a = 0.5;
//   vec2 shift = vec2(100.0);
//   // Rotate to reduce axial bias
//   mat2 rot = mat2(cos(0.5), sin(0.5),
//                   -sin(0.5), cos(0.50));
//   for (int i = 0; i < octaves; ++i) {
//       v += a * noise(_st, seed);
//       _st = rot * _st * 2.0 + shift;
//       a *= 0.4;
//   }
//   return v;
// }



// float pattern( in vec2 p,in float u_time, out vec2 q, out vec2 r )
// {
//     q.x = fbm( p + vec2(0.0,0.0),seed );
//     q.y = fbm( p + vec2(5.2,1.3),seed );

//     r.x = fbm( p + 4.0*q + vec2(1.7,9.2),seed );
//     r.y = fbm( p + 4.0*q + vec2(8.3,2.8),seed );

//     return fbm( p + 4.0*r,seed );
// }





// void main(){
//   // vec2 uv = (gl_FragCoord.xy * 2.0 - u_resolution) / min(u_resolution.x,u_resolution.y);

//   // vec2 q=vec2(0.0,0.0);
//   // vec2 r=vec2(0.0,0.0);

//   // float _pattern = 0.0;
  
//   // _pattern = pattern(uv,u_time,q,r);

//   // vec3 color = vec3(_pattern);

//   vec3 position = texture2D(u_texture,vUv).rgb;

//   gl_FragColor = vec4(position,1.0);
// }


void main() {
  vec3 texture = texture2D(u_texture, vUv).rgb;

  gl_FragColor = vec4(texture, 1.);
}