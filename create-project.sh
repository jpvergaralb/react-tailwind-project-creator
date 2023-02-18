#!/bin/bash

# Pide el nombre del proyecto
read -p "Ingresa el nombre del proyecto: " project_name

# Crea el proyecto con create-react-app
npx create-react-app@latest "$project_name" 

# Cambia al directorio del proyecto
cd "$project_name"

# Instala tailwindcss como dependencia de desarrollo
npm install -D tailwindcss

# Inicializa el archivo de configuración de TailwindCSS
npx tailwindcss init

# Instala prettier y prettier-plugin-tailwindcss como dependencia de desarrollo
npm install -D prettier prettier-plugin-tailwindcss

# Modifica el archivo tailwind.config.js
cat << 'EOF' > tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        "gh-dark": "#0d1117",
        "gh-dark-light": "#161b22",
        "gh-dark-lighter": "#21262d",
        "gh-dark-lightest": "#2f363d",
        "cool-dark": "#0e0e0e",
      }
    },
  },
  plugins: [],
}
EOF

# Modifica el archivo index.css
cat << 'EOF' > src/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  font-family: code, monospace;
}

EOF

# Modifica el archivo src/App.js
cat << 'EOF' > src/App.js
function App() {
  return (
    <div className="h-screen bg-gh-dark text-white text-medium">
      <h1 className="text-center">hewhehehe</h1>
    </div>
  );
}

export default App;
EOF

echo "Listo, ya puedes iniciar el proyecto con npm run start"
