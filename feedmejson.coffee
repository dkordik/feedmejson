fs = require 'fs'
http = require 'http'

server = (req, res) ->
  filename = req.url.slice(1)
  res.writeHead 200,
    'Content-Type': 'application/json'
    'Access-Control-Allow-Origin': '*'
  res.end fs.readFileSync filename

port = 1337

http.createServer(server).listen(port)
console.log 'Listening on port ' + port + ', feeding JSON files from ' + __dirname