const db = require("../../config/db");

module.exports = (app) => {
  const connection = db();

  app.get("/", (req, res) => {
    connection.query("call dataget", (err, result) => {
      if (!result) {
        console.log("Sin resultados");
      } else {
        res.render("libreria/libreria", {
          libreria: result[0],
        });
      }
    });
  });

  app.post("/libreria", (req, res) => {
    const { titulo, descripcion } = req.body;
    console.log(titulo + "  " + descripcion);
    connection.query(
      `Call datainsert("${titulo}","${descripcion}")`,
      (err, result) => {
        res.redirect("/");
      }
    );
  });

  app.post("/delete", (req, res) => {
    const IDlibro = req.body;
    connection.query(`Call datadelete("${IDlibro}")`, (err, result) => {
      res.redirect("/");
    });
    console.log(IDlibro);
  });
};
