mongoose = require('mongoose')

UserSchema = new mongoose.Schema({
  first_name: { 'type': String },
  last_name: { 'type': String },
  email: { 'type': String },
  password: { 'type': String },
})

module.exports = mongoose.model('User', UserSchema)