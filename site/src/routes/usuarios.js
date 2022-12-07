var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/", function (req, res) {
    usuarioController.testar(req, res);
});

router.get("/listar", function (req, res) {
    usuarioController.listar(req, res);
});

router.get("/maxima", function (req, res) {
    usuarioController.maxima(req, res);
});

router.get("/menor", function (req, res) {
    usuarioController.menor(req, res);
});

router.get("/maximaUmidade", function (req, res) {
    usuarioController.maximaUmidade(req, res);
});

router.get("/minimaUmidade", function (req, res) {
    usuarioController.minimaUmidade(req, res);
});

router.get("/percentualIdeal", function (req, res) {
    usuarioController.percentualIdeal(req, res);
});

router.get("/percentualIdealUmid", function (req, res) {
    usuarioController.percentualIdealUmid(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.entrar(req, res);
});

router.post("/orcamento", function (req, res) {
    usuarioController.orcamento(req, res);
})


module.exports = router;