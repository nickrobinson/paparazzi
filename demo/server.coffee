# Using the Paparazzo.js module

Paparazzo = require '../src/paparazzo'
express = require 'express'
app = express()

# For a list of public cameras to test check:
# https://github.com/rodowi/Paparazzo.js/wiki/List-of-public-cameras

paparazzo = new Paparazzo
    url: 'http://67.109.86.186/mjpg/video.mjpg'

updatedImage = ''

paparazzo.on "update", (image) =>
    updatedImage = image
    console.log "Downloaded #{image.length} bytes"

paparazzo.on 'error', (error) =>
    console.log "Error: #{error.message}"

paparazzo.start()

app.get '/camera', (req, res, next) ->
    res.status 200
    res.set
      'Content-Type': 'image/jpeg'
      'Content-Length': updatedImage.length
    res.end updatedImage, 'binary'

app.listen 3000
