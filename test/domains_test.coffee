chai = require 'chai'
expect = chai.expect

Domains = require '../src/domains'

describe 'Domains', ->

  it 'should have a constructor', (done) ->
    domains = new Domains()
    expect(domains).to.exist
    done()
