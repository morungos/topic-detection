module.exports = class

  ## Not initialized in the constructor, so it's part of the prototype
  ## and shared as a class variable.

  domains: require './data/domains.json'
  hierarchy: require './data/domain_hierarchy.json'

  ## Handles the topic breakdown for a single word
  find: (key) ->
    domains = @domains
    hierarchy = @hierarchy
    possibles = if domains.hasOwnProperty(key) then domains[key]
    return null if ! possibles?

    table = {}
    count = 0
    for own k, v of possibles
      for element in v
        primary = hierarchy[element]
        if primary?
          table[primary] ?= 0
          table[primary]++
          count++

    return null if count == 0

    for own k, v of table
      table[k] = table[k] / count

    table

  tokenize = (passage) ->
    passage.split /[\s\.,!?]+/

  ## Handles the topic breakdown for a passage of text
  topics: (passage) ->
    tokens = tokenize passage

    count = 0
    result = {}
    for token in tokenize passage
      categories = @find token
      if categories?
        for own k, v of categories
          result[k] ?= 0
          result[k] += v
          count++

    return null if count == 0
    for own k, v of result
      result[k] = result[k] / count

    sortFn = (a, b) -> result[b] - result[a]
    sorted = []
    for k in Object.keys(result).sort sortFn
      sorted[k] = result[k]

    sorted
