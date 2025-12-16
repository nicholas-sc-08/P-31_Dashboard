import { configDotenv } from "dotenv";
import app from "./app";

configDotenv();

const port: number = Number(process.env.PORT);
app.listen({ port: port }, () => console.log(`Server running at port ${port}`));