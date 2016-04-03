chai = require 'chai'
expect = chai.expect

Domains = require '../src/domains'

describe 'Domains', ->

  it 'should have a constructor', (done) ->
    domains = new Domains()
    expect(domains).to.exist
    done()

  describe 'word tests', () ->

    domains = new Domains()

    it 'should return null for a non-word', (done) ->
      expect(domains.find('dvwyvsw')).to.be.null
      done()
