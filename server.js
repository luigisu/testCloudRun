import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

app.use(express.static(path.join(__dirname, "dist/cloudrun")));

app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "dist/cloudrun", "index.html"));
});

const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log(`App listening on por.t ${port}`);
});
