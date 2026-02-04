# Node compatible con Vite
FROM node:20

# Carpeta de trabajo
WORKDIR /app

# Copiamos solo lo necesario primero (mejor cache)
COPY package*.json ./

# Instalamos dependencias
RUN npm install

# Copiamos el resto del proyecto
COPY . .

# Deshabilitar protección DNS rebinding de Vite
ENV VITE_ALLOWED_HOSTS=*

# Puerto que usa Vite
EXPOSE 5173

# Arranque en modo dev
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
