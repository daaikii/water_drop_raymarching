uniform float u_time;
uniform sampler2D u_texture;
varying vec2 vUv; 


float smin(float a,float b,float k){
  float h = max(k-abs(a-b),0.0)/k;
  return min(a,b)-h*h*h*k*(1.0/6.0);
}

float sdSphere (vec3 p , float r){
  return length(p)-r;
}

float map(vec3 p){
  float sphere=999.;

  // vec3 spherePos = vec3(0.,0.0,0.0);
  // sphere =sdSphere(p-spherePos,.5);
  for(int i=0;i<5;i++){
    float fi = float(i) * 0.8+ u_time * 0.1;
    vec3 pp = p + vec3(
        cos(fi* 1.7),
        sin(fi * 2.3),
        sin(fi * 1.9)
    ) * .5;
    sphere = smin(sphere,sdSphere(pp,0.3),1.);
  }

  // float ground = p.y +1. ;

  // float d = min(sphere,ground);
  float d = sphere;
  return d;
}

vec3 calcNormal(in vec3 pos){
  vec2 e = vec2(0.001,0.0);
  return normalize(vec3(map(pos+e.xyy)-map(pos-e.xyy),
                        map(pos+e.yxy)-map(pos-e.yxy),
                        map(pos+e.yyx)-map(pos-e.yyx)
  ));
}

float fresnel (vec3 r,vec3 n){
  return pow(1.+dot(r,n),4.0)*0.3;
}


//------------------------------------------------------------
void main() {

  vec2 centerUV = vUv -0.5 ;

  vec3 ro = vec3(0.0,0.0,-3.);        //ray origin
  vec3 rd = normalize(vec3(centerUV*3.,3.));  //ray direction

  // vec2 hit = vec2(0.,0.);
  float t = 0.;  //total distance travelled

  for(int i = 0; i<80 ;i++){
    vec3 p = ro + rd * t;  //position along the ray

    float d = map(p); //current distance to the scene

    t += d; //"march" the ray
    if(d < 0.01 || t > 100.)break;
  }
  vec2 uv = vUv ;
  vec3 color = texture2D(u_texture,uv).rgb;

  if(t<100.){
    vec3 pos = ro + rd * t;
    vec3 nor = calcNormal(pos);
    float f = fresnel(rd,nor);

    float len = pow(length(nor.xy),2.0);
    uv+=nor.xy*len*0.1;

    vec3 reflTex = texture2D(u_texture,uv).rgb;
    reflTex += f;
    color = vec3(reflTex);
  }



  // color = vec3(t*.1);


  gl_FragColor = vec4(color.zzz, 1.);
  // if(t>100.){
  //   gl_FragColor = vec4(0.0);
  // }
}




  // vec3 texture = texture2D(u_texture, vUv).rgb;