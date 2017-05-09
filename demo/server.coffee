# Using the Paparazzi.js module

Paparazzi = require '../src/paparazzi'
express = require 'express'
app = express()

# For a list of public cameras to test check:
# https://github.com/rodowi/Paparazzo.js/wiki/List-of-public-cameras

paparazzi = new Paparazzi
    url: 'http://67.109.86.186/mjpg/video.mjpg'

updatedImage = ''

paparazzi.on "update", (image) =>
    updatedImage = image
    console.log "Downloaded #{image.length} bytes"

paparazzi.on 'error', (error) =>
    console.log "Error: #{error.message}"

paparazzi.start()

app.get '/camera', (req, res, next) ->
    res.status 200
    res.set
      'Content-Type': 'image/jpeg'
      'Content-Length': updatedImage.length
    res.end updatedImage, 'binary'

app.listen 3000
