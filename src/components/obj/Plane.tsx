import * as THREE from "three"
import { useRef, useMemo } from "react"
import { useFrame } from "@react-three/fiber"
import { createPortal } from "@react-three/fiber"

import Font from "../obj/Font"
import vertex from "../../glsl/planeVertex.glsl"
import fragment from "../../glsl/planeFragment.glsl"

const Plane = () => {
  const cam = useRef()
  const [scene, target] = useMemo(() => {
    const scene = new THREE.Scene()
    scene.background = new THREE.Color("rgb(100,100,100)")
    const target = new THREE.WebGLRenderTarget(window.innerWidth, window.innerHeight)
    return [scene, target]
  }, [])

  useFrame((state) => {
    state.gl.setRenderTarget(target)
    state.gl.render(scene, cam.current)
    state.gl.setRenderTarget(null)
  })

  return (
    <>
      <perspectiveCamera ref={cam} position={[0, 0, 15]} />
      {createPortal(<Font />, scene)}
      <mesh >
        <planeGeometry args={[2, 2]} />
        <shaderMaterial
          attach="material"
          args={[
            {
              vertexShader: vertex,
              fragmentShader: fragment,
              uniforms: {
                u_texture: { value: target.texture },
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