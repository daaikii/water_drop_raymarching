import { useMemo, useRef } from "react"
import { createPortal, useFrame } from "@react-three/fiber"
import * as THREE from "three"

import vertex from "../../glsl/planeVertex.glsl"
import fragment from "../../glsl/planeFragment.glsl"
import Font from "./Font"

const Plane = () => {
  const camera = useRef()
  const matRef = useRef()
  const [scene, target] = useMemo(() => {
    const scene = new THREE.Scene()
    scene.background = new THREE.Color("rgb(199,199,240)")
    const renderTarget = new THREE.WebGLRenderTarget(1024, 1024)
    return [scene, renderTarget]
  }, [])

  useFrame(({ gl }) => {
    gl.setRenderTarget(target);
    gl.render(scene, camera.current);
    gl.setRenderTarget(null)
    matRef.current.uniforms.u_time.value += 0.015;
  })
  return (
    <>
      <perspectiveCamera
        ref={camera}
        args={[50, 1, 1, 1000]}
        position={[0, 0, 10]}
      />
      {createPortal(<Font />, scene)}
      <mesh >
        <planeGeometry args={[7, 7]} />
        <shaderMaterial
          attach="material"
          ref={matRef}
          args={[
            {
              vertexShader: vertex,
              fragmentShader: fragment,
              uniforms: {
                u_time: { value: 0 },
                u_texture: { value: target.texture }
              }
            }
          ]}
        />
        {/* <meshStandardMaterial map={target.texture} /> */}
      </mesh>
    </>
  )
}


export default Plane;