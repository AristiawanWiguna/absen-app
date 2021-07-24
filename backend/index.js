// import express
import express from "express";
// import cors
import cors from "cors";
// import routes
import Router from "./routes/routes.js";
 
// init express
const app = express();

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.header("Access-Control-Allow-Credentials", true); // Required for cookies, authorization headers with HTTPS
    res.header("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    next();
  });
 
// use express json
app.use(express.json());

// use cors
app.use(cors());
 
// use router
app.use(Router);
 
app.listen(5000, () => console.log('Server running at http://localhost:5000'));

