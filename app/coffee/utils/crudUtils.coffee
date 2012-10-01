###
Very basic CRUD route creation utility for models.
For validation, simply override the model's save method.
###
((exports) ->
  errMsg = (msg) ->
    error:
      message: msg.toString()
  
  #------------------------------
  # List
  #
  getListController = (model) ->
    (req, res) ->
      
      #console.log('list', req.body);
      model.find {}, (err, result) ->
        unless err
          res.send result
        else
          res.send errMsg(err)

  
  #------------------------------
  # Create
  #
  getCreateController = (model) ->
    (req, res) ->
      
      #console.log('create', req.body);
      m = new model(req.body)
      m.save (err) ->
        unless err
          res.send m
        else
          res.send errMsg(err)

  
  #------------------------------
  # Read
  #
  getReadController = (model) ->
    (req, res) ->
      
      #console.log('read', req.body);
      model.findById req.params.id, (err, result) ->
        unless err
          res.send result
        else
          res.send errMsg(err)

  
  #------------------------------
  # Update
  #
  getUpdateController = (model) ->
    (req, res) ->
      
      #console.log('update', req.body);
      model.findById req.params.id, (err, result) ->
        key = undefined
        for key of req.body
          result[key] = req.body[key]
        result.save (err) ->
          unless err
            res.send result
          else
            res.send errMsg(err)


  
  #------------------------------
  # Delete
  #
  getDeleteController = (model) ->
    (req, res) ->
      
      #console.log('delete', req.body);
      model.findById req.params.id, (err, result) ->
        if err
          res.send errMsg(err)
        else
          result.remove()
          result.save (err) ->
            unless err
              res.send {}
            else
              res.send errMsg(err)


  "use strict"
  exports.initRoutesForModel = (options) ->
    app = options.app
    model = options.model
    path = undefined
    pathWithId = undefined
    return  if not app or not model
    path = options.path or "/" + model.modelName.toLowerCase()
    pathWithId = path + "/:id"
    app.get path, getListController(model)
    app.post path, getCreateController(model)
    app.get pathWithId, getReadController(model)
    app.put pathWithId, getUpdateController(model)
    app.del pathWithId, getDeleteController(model)
) exports
