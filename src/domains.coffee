module.exports = class

  ## Not initialized in the constructor, so it's part of the prototype
  ## and shared as a class variable.

  domains: require './data/domains.json'
  hierarchy: require './data/domain_hierarchy.json'

  find: (key) ->
    domains = @domains
    possibles = if domains.hasOwnProperty(key) then domains[key]
    return null if ! possibles?
