const app = require("./config/server");

require("colors");
require("./app/routes/libros")(app);

app.listen(app.get('port'),() =>{
 console.log("[SERVER]".green,"online in",app.get('port'));
});