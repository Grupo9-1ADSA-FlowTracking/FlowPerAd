var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idArduino", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

// router.get("/ultimas-barra/:idArduino", function (req, res) {
//     medidaController.buscarUltimasMedidasBarra(req, res);
// });

router.get("/tempo-real/:idArduino", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;