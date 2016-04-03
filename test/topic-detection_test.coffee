chai = require 'chai'
expect = chai.expect

TopicDetection = require '../src/topic-detection'

describe 'TopicDetection', ->

  it 'should have a constructor', (done) ->
    detector = new TopicDetection()
    expect(detector).to.exist
    done()

  describe 'word tests', () ->

    detector = new TopicDetection()

    it 'should return null for a non-word', (done) ->
      expect(detector.find('dvwyvsw')).to.be.null
      done()

    it 'should return {"psychology":1} for "zoopsia"', (done) ->
      result = detector.find('zoopsia')
      expect(result).to.exist
      expect(result).to.have.property('psychology').and.equal(1)
      expect(Object.keys(result)).to.have.members(['psychology'])
      done()

    it 'should return {"transport":0.5,"engineering":0.5} for "zoom"', (done) ->
      result = detector.find('zoom')
      expect(result).to.exist
      expect(result).to.have.property('transport').and.equal(0.5)
      expect(result).to.have.property('engineering').and.equal(0.5)
      expect(Object.keys(result)).to.have.members(['transport', 'engineering'])
      done()

  describe 'passage tests', () ->

    detector = new TopicDetection()

    it 'should correctly classify a paragraph as "politics"', (done) ->

      text = """
The nature of the relationship among the states constituting a confederation
varies considerably. Likewise, the relationship between the member states, the
central government, and the distribution of powers among them is highly
variable. Some looser confederations are similar to intergovernmental
organizations and even may permit secession from the confederation. Other
confederations with stricter rules may resemble federations. A unitary state
or federation may decentralize powers to regional or local entities in a
confederal form.
"""

      result = detector.topics(text)
      expect(result).to.exist
      expect(Object.keys(result).length).to.be.above(1)
      sortFn = (a, b) -> result[b] - result[a]
      sorted = Object.keys(result).sort sortFn
      expect(sorted[0]).to.equal("politics")
      done()

    it 'should correctly classify a paragraph as "law"', (done) ->

      text = """
The prosecutor's fallacy is a fallacy of statistical reasoning, typically
used by the prosecution to argue for the guilt of a defendant during a
criminal trial. Although it is named after prosecutors it is not specific
to them, and some variants of the fallacy can be utilized by defense lawyers
arguing for the innocence of their client. At its heart the fallacy involves
assuming that the prior probability of a random match is equal to the
probability that the defendant is innocent. For instance, if a perpetrator is
known to have the same blood type as a defendant and 10% of the population
share that blood type, then to argue on that basis alone that the probability
of the defendant being guilty is 90% makes the prosecutor's fallacy (in a very
simple form).
"""

      result = detector.topics(text)
      expect(result).to.exist
      expect(Object.keys(result).length).to.be.above(1)
      sortFn = (a, b) -> result[b] - result[a]
      sorted = Object.keys(result).sort sortFn
      expect(sorted[0]).to.equal("law")
      done()
