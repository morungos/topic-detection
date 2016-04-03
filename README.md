# topic-detection

A simple topic detection module, based on Wordnet Domains data

## API

### new TopicDetection()

A basic constructor

### detector.topics(text)

Returns a list of topics with normalized scores. There isn't a reliable order
as JavaScript doesn't allow that, so you'll need to sort by score yourself to
get the top scored topic.

    var TopicDetection = require('topic-detection');
    var detector = new TopicDetection();
    var scores = detector.topics(myText);

## License

Available under the MIT License. This module also contains data based on the
Wordnet Domains data, used under the Creative Commons Attribution 3.0 Unported
License.

Publications or presentations containing research results obtained through
the use of WordNet Domains should cite at least one of the following
references:

* Luisa Bentivogli, Pamela Forner, Bernardo Magnini and Emanuele Pianta.
  "Revising WordNet Domains Hierarchy: Semantics, Coverage, and Balancing", in
  COLING 2004 Workshop on "Multilingual Linguistic Resources", Geneva,
  Switzerland, August 28, 2004, pp. 101-108.

* Bernardo Magnini and Gabriela Cavaglià. "Integrating Subject Field Codes into
  WordNet", in Gavrilidou M., Crayannis G., Markantonatu S., Piperidis S. and
  Stainhaouer G. (Eds.) Proceedings of LREC-2000, Second International
  Conference on Language Resources and Evaluation, Athens, Greece, 31 May -
  2 June, 2000, pp. 1413-1418.
