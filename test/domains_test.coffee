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

    it 'should return {"psychology":1} for "zoopsia"', (done) ->
      result = domains.find('zoopsia')
      expect(result).to.exist
      expect(result).to.have.property('psychology').and.equal(1)
      expect(Object.keys(result)).to.have.members(['psychology'])
      done()

    it 'should return {"transport":0.5,"engineering":0.5} for "zoom"', (done) ->
      result = domains.find('zoom')
      expect(result).to.exist
      expect(result).to.have.property('transport').and.equal(0.5)
      expect(result).to.have.property('engineering').and.equal(0.5)
      expect(Object.keys(result)).to.have.members(['transport', 'engineering'])
      done()
