const express = require('express');
const router  = express.Router();

/* GET home page */
router.get('/', (req, res, next) => {
  res.render('index');
});

router.get('/prueba', (req, res) => {
  res.send("Holaaaaa ")
})

module.exports = router;
