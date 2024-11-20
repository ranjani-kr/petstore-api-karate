function fn() {
  karate.log('karate-config.js is loaded'); // Debug message
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);
    return {};
}
