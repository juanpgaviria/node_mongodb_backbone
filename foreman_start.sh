#!/bin/bash

# Compile all the coffeescript files
node_modules/coffee-script/bin/cake build

# executes app
if [ "$NODE_ENV" == "production" ]
then
  node app/app.js
else
  supervisor app/app.js
fi
