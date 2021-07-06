var express = require('express');
var bodyParser = require('body-parser')
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var mongoose = require('mongoose');
require('dotenv/config');

var appName = `${process.env.APP_NAME}`;

app.use(express.static(__dirname));
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

//Models
var Message = mongoose.model('Message',{
    name : String,
    message : String
})

//db string connection
var dbUrl = `mongodb+srv://${process.env.DB_USER}:${process.env.DB_PASS}@${process.env.DB_HOST}/${process.env.DB_NAME}?retryWrites=true&w=majority`

//routes
app.get('/messages', (req, res) => {
    Message.find({},(err, messages)=> {
        res.send(messages);
    })
})

app.get('/messages/:user', (req, res) => {
    var user = req.params.user
    Message.find({name: user},(err, messages)=> {
        res.send(messages);
    })
})

app.post('/messages', async (req, res) => {
    try{
        var message = new Message(req.body);

        var savedMessage = await message.save()
            console.log('saved');

        var censored = await Message.findOne({message:'badword'});
        if(censored)
            await Message.remove({_id: censored.id})
        else
            io.emit('message', req.body);
            res.sendStatus(200);
    }
    catch (error){
        res.sendStatus(500);
        return console.log('error',error);
    }
    finally{
        console.log('Message Posted')
    }
})

//socket.io
io.on('connection', () =>{
    console.log('socket.io : a user is connected')
})

//mongo connect
mongoose.connect(dbUrl ,{ useNewUrlParser: true, useUnifiedTopology: true }).then(
    msg => console.log("connect mongo ok")
).catch(
    err => console.log("connect mongo failed")
)

//start server
var server = http.listen(3000, () => {
    console.log('server is running on port', server.address().port);
});