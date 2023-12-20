
function route(app) {
  app.get('/', (req, res) => {
    res.send('user API!');
  });
}

module.exports = route;
