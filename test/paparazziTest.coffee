# To run:
# $ mocha --compilers coffee:coffee-script -R spec

chai = require 'chai'
chai.should()
expect = chai.expect

Paparazzi = require '../src/paparazzi'

paparazzi = null

describe 'Paparazzi constructor', ->
    it 'should assign port 80 by default', ->
        url = 'http://67.109.86.186/mjpg/video.mjpg'
        paparazzi = new Paparazzi
            url: url
        paparazzi.options.url.should.equal url
