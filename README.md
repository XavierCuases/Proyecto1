<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Servidor Local en Node.js con Despliegue Automatizado</title>
</head>
<body>
    <h1>Servidor Local en Node.js con Despliegue Automatizado</h1>

    <h2>Descripción</h2>
    <p>
        Este proyecto consiste en un servidor básico en Node.js que responde con contenido HTML. También incluye la configuración de un pipeline en GitHub Actions para pruebas automáticas y preparación para un despliegue continuo en AWS.
    </p>

    <h2>Requisitos</h2>
    <ul>
        <li>Node.js (versión 16 o superior).</li>
        <li>Cuenta en GitHub.</li>
        <li>Configuración de AWS CLI (opcional para despliegue).</li>
    </ul>

    <h2>Instalación y Uso</h2>
    <ol>
        <li>
            <strong>Clona el repositorio:</strong>
            <pre><code>git clone https://github.com/usuario/repositorio.git
cd repositorio</code></pre>
        </li>
        <li>
            <strong>Ejecuta el servidor local:</strong>
            <p>Crea un archivo <code>server.js</code> con el siguiente contenido:</p>
            <pre><code>const http = require('http');

const PORT = 3000;

const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end('&lt;h1&gt;¡Hola, mundo desde Node.js!&lt;/h1&gt;');
});

server.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});</code></pre>
            <p>Inicia el servidor con:</p>
            <pre><code>node server.js</code></pre>
        </li>
        <li>
            <strong>Verifica la ejecución:</strong>
            <p>Abre un navegador web e ingresa a <a href="http://localhost:3000" target="_blank">http://localhost:3000</a>.</p>
        </li>
    </ol>

    <h2>Automatización con GitHub Actions</h2>
    <ol>
        <li>
            Crea el archivo <code>.github/workflows/nodejs.yml</code> con el siguiente contenido:
            <pre><code>name: Node.js CI/CD

on:
  push:
    branches:
      - main

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Node.js
      uses: actions/setup-node@v3
      with:
        node-version: 16

    - name: Install dependencies
      run: npm install

    - name: Run tests
      run: echo "Añadir pruebas aquí en el futuro"</code></pre>
        </li>
        <li>
            Realiza un <strong>push</strong> al repositorio para activar el pipeline.
        </li>
    </ol>

    <h2>Licencia</h2>
    <p>Este proyecto está bajo la licencia MIT.</p>
</body>
</html>
