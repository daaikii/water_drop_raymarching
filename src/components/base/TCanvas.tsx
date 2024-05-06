import { Canvas } from '@react-three/fiber'
import { OrbitControls } from '@react-three/drei'
import Plane from '../obj/Plane'

const TCanvas = () => {
  return (
    <Canvas >
      <ambientLight />
      <spotLight position={[10, 10, 10]} />
      <pointLight position={[-10, -10, -10]} />
      <Plane />
      <OrbitControls />
    </Canvas>
  )
}

export default TCanvas