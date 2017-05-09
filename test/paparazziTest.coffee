# To run:
# $ mocha --compilers coffee:coffee-script -R spec

chai = require 'chai'
chai.should()
expect = chai.expect

Paparazzi = require '../src/paparazzi'

paparazzi = null

describe 'Paparazzi constructor', ->
    it 'should assign port 80 by default', ->
        paparazzi = new Paparazzi
            host: '85.105.120.239'
        paparazzi.options.port.should.equal 80
    it 'should looked after "/" by default', ->
        paparazzi = new Paparazzi
            host: '85.105.120.239'
        paparazzi.options.path.should.equal '/'
    it 'should be initialized with a host parameter', ->
        paparazzi = new Paparazzi
            port: 1337
        paparazzi.should.equal {}

