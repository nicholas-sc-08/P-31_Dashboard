FROM node:20-slim

# 1. Instala o OpenSSL (necessário para o Prisma)
RUN apt-get update -y && apt-get install -y openssl

WORKDIR /app

COPY package*.json ./

RUN npm install && npm install nodemon

# 2. Copia o projeto inteiro (incluindo a pasta prisma)
COPY . . 

# 3. Gera o Prisma Client (isso pode rodar no build)
RUN npx prisma generate

EXPOSE 8080

# 4. O db push e o servidor rodam apenas quando o container iniciar
CMD npx prisma db push && npm run dev src/server.ts