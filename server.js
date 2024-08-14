import express from "express";
import path from "path";

const app = express();

// Servir los archivos estáticos de Angular
app.use(express.static(path.join(__dirname, "dist/cloudrun")));

// Ruta por defecto
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "dist/cloudrun", "index.html"));
});

const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
