// Entry point for the build script in your package.json
import React from 'react'
import { createRoot } from 'react-dom'

import Roots from 'Roots'

const container = document.getElementById('react-app-container')
const root = createRoot(container);

root.render(<Roots />)