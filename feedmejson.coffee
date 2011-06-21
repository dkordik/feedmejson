fs = require 'fs'
http = require 'http'

log = (msg) ->
  console.log new Date().toTimeString(), msg
  msg

server = (req, res) ->
  match = req.url.match /\/([a-zA-Z0-9\.]+)(\?.*|$)/
  if !match
    res.end log "Unrecognized url format."
  else
    filename = match[1]
    fs.readFile filename, null, (err, data) ->
      if err
        res.end log err.message
      else
        res.writeHead 200,
          'Content-Type': 'application/json'
          'Access-Control-Allow-Origin': '*'
        log "=> " + filename
        res.end data

port = 1337

http.createServer(server).listen(port)
console.log 'Listening on port ' + port + ', feeding JSON files from ' + __dirname