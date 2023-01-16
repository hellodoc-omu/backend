const socketio = require('socket.io');

module.exports.SocketConn = function (server) {
  const io = socketio(server, {});

  io.on('connection', (socket) => {
    console.log('An User Connected the Server!');

    socket.on('sendMessage', (data) => {
      io.emit('receiveMessages');
    });
  });
};
