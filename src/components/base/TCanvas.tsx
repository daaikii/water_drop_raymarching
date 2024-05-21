import { Canvas } from '@react-three/fiber'
import { OrbitControls } from '@react-three/drei'
import Plane from '../obj/Plane'

const TCanvas = () => {
  return (
    <Canvas >
      <color attach="background" args={[0, 0, 1]} />
      <ambientLight />
      <pointLight position={[-10, -10, -10]} />
      <Plane />
    </Canvas>
  )
}

export default TCanvas