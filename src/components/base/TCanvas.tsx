import { Canvas } from '@react-three/fiber'
import Plane from '../obj/Plane'

const TCanvas = () => {
  return (
    <Canvas >
      <color attach="background" args={[1, 1, 1]} />
      <Plane />
    </Canvas>
  )
}

export default TCanvas