((exports) ->
  index = (req, res) ->
    res.render "index",
      title: "Livescoop City explor toolasd"

  "use strict"
  mongoose = require("mongoose")
  crudUtils = require("../utils/crudUtils")
  User = mongoose.model("User")
  exports.init = (app) ->
    app.get "/", index
    crudUtils.initRoutesForModel
      app: app
      model: User

) exports

