import { FC } from 'react';
import { Canvas } from '@react-three/fiber';

const canvasComp: FC = () => {
  return (
    <Canvas>
      <spotLight />
    </Canvas>
  )
}

export default canvasComp