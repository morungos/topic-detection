module.exports = class

  ## Not initialized in the constructor, so it's part of the prototype
  ## and shared as a class variable.

  domains: require './data/domains.json'
  hierarchy: require './data/domain_hierarchy.json'

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
