var hasProp = {}.hasOwnProperty;

module.exports = (function() {
  var tokenize;

  function _Class() {}

  _Class.prototype.domains = require('./data/domains.json');

  _Class.prototype.hierarchy = require('./data/domain_hierarchy.json');

  _Class.prototype.find = function(key) {
    var count, domains, element, hierarchy, i, k, len, possibles, primary, table, v;
    domains = this.domains;
    hierarchy = this.hierarchy;
    possibles = domains.hasOwnProperty(key) ? domains[key] : void 0;
    if (possibles == null) {
      return null;
    }
    table = {};
    count = 0;
    for (k in possibles) {
      if (!hasProp.call(possibles, k)) continue;
      v = possibles[k];
      for (i = 0, len = v.length; i < len; i++) {
        element = v[i];
        primary = hierarchy[element];
        if (primary != null) {
          if (table[primary] == null) {
            table[primary] = 0;
          }
          table[primary]++;
          count++;
        }
      }
    }
    if (count === 0) {
      return null;
    }
    for (k in table) {
      if (!hasProp.call(table, k)) continue;
      v = table[k];
      table[k] = table[k] / count;
    }
    return table;
  };

  tokenize = function(passage) {
    return passage.split(/[\s\.,!?]+/);
  };

  _Class.prototype.topics = function(passage) {
    var categories, count, i, j, k, len, len1, ref, ref1, result, sortFn, sorted, token, tokens, v;
    tokens = tokenize(passage);
    count = 0;
    result = {};
    ref = tokenize(passage);
    for (i = 0, len = ref.length; i < len; i++) {
      token = ref[i];
      categories = this.find(token);
      if (categories != null) {
        for (k in categories) {
          if (!hasProp.call(categories, k)) continue;
          v = categories[k];
          if (result[k] == null) {
            result[k] = 0;
          }
          result[k] += v;
          count++;
        }
      }
    }
    if (count === 0) {
      return null;
    }
    for (k in result) {
      if (!hasProp.call(result, k)) continue;
      v = result[k];
      result[k] = result[k] / count;
    }
    sortFn = function(a, b) {
      return result[b] - result[a];
    };
    sorted = [];
    ref1 = Object.keys(result).sort(sortFn);
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      k = ref1[j];
      sorted[k] = result[k];
    }
    return sorted;
  };

  return _Class;

})();
