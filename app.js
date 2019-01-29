var express = require('express');
var app = express();
var server = require('http').Server(app);
var io = require('socket.io')(server);
var exec = require('child_process').exec;


app.get('/', function(req, res) {
res.sendFile(__dirname + '/index.html');});
app.use(express.static(__dirname + 'public'));

server.listen(3000);

// app.get('/', function (req, res) {
//   res.sendfile(__dirname + '/index.html');
// });


io.on('connection', function (socket) {
  //socket.emit('server', { hello: 'world' });
  socket.on('client', function (data) {
    console.log(data);
    if(data.status == 1){
      let command = exec('mysqldump --user=root --password=password -h 127.0.0.1 -P 3306 myamiko > myamiko_2801201901.sql');

      console.log(command);

      socket.emit('server', { response : 'Success backup' })
    }
  });
});



