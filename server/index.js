// importing everything 
const express =  require("express");
const http =  require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server =  http.createServer(app);

var io =  require("socket.io")(server);

//middleware 
app.use(express.json());

const DB = "mongodb+srv://gurparvesh:grewal@cluster-fluttertictacto.xm9hojz.mongodb.net/?retryWrites=true&w=majority&appName=Cluster-FlutterTictactoe";

io.on("connection", (socket) => {
    console.log("socket connected");
    socket.on("createRoom", ({ nickname }) => {
        console.log(nickname);
    } );
});

mongoose.connect(DB).then(()=> {
    console.log("DB connection successful!");
}).catch((e)=> {
    console.log(e);
});

server.listen(port, '0.0.0.0', ()=> {
    console.log(`server started and running on port: ${port}`);
});