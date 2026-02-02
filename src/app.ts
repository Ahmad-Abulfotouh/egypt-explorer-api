import express from "express";
import publicRoutes from "./api/v1/routes/public/index.js";
import cmsRoutes from "./api/v1/routes/cms/index.js";

const app = express();

app.use(express.json());

app.use('/api/v1/', publicRoutes);
app.use('/api/v1/cms', cmsRoutes);

export default app;