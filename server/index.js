// importing everything 
const express =  require("express");
const http =  require("http");
const mongoose = require("mongoose");

// models
const Room = require('./models/room');

const app = express();
const port = process.env.PORT || 3000;
var server =  http.createServer(app);

var io =  require("socket.io")(server);

//middleware 
app.use(express.json());

const DB = "mongodb+srv://gurparvesh:grewal@cluster-fluttertictacto.xm9hojz.mongodb.net/mySecondDatabase?retryWrites=true&w=majority&appName=Cluster-FlutterTictactoe";

io.on("connection", (socket) => {
    console.log("socket connected");
    socket.on("createRoom", async ({ nickname }) => {
        console.log(nickname);
        // room creation 
        try{ let room  = new Room();
        let player = {
            socketId : socket.id,
            nickname,
            playerType : 'X',
        };
        room.players.push(player);
        room.turn = player;

        // saving room at MongoDB
        room = await room.save();

        const roomId = room._id.toString();

        // our socket will join to specific room 
        socket.join(roomId);

        // io sends data to everyone
        // whereas socket sends data to yourself
        io.to(roomId).emit("createRoomSuccess", room);
    }catch(e){
            console.log(e);
        }
    } );
    socket.on("joinRoom",  async ({ nickname, roomId }) => {
        try{
            if(!roomId.match(/^[0-9a-fA-F]{24}$/)){
                socket.emit('errorOccured', 'please enter a valid room id');
                return;
            }
            
            let room  =  await Room.findById(roomId);

            if(room.isJoin){
                let player = {
                    nickname,
                    socketId : socket.id,
                    playerType : '0', 
                }

                socket.join(roomId);
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();
                io.to(roomId).emit("joinRoomSuccess", room);
                io.to(roomId).emit("updatePlayers", room.players);
            }else{
                socket.emit('errorOccurred','The game is in progress, try again later');
                return;
            }
        }
        catch (e){
            console.log(e);
        }
    });
});

mongoose.connect(DB).then(()=> {
    console.log("DB connection successful!");
}).catch((e)=> {
    console.log(e);
});

server.listen(port, '0.0.0.0', ()=> {
    console.log(`server started and running on port: ${port}`);
});