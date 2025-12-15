import fastify from "fastify";
import fastifyCors from "@fastify/cors";

const app = fastify();
app.register(fastifyCors);

export default app;