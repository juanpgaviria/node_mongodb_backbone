node_mongodb_backbone
=====================

Initial code to start a node.js with mongoDB and backbone.js

Setup
=====

Install nodeevn

    pip install nodeenv
   

create new virtualenv
    nodeenv <name>
    

add the nodeenv to .gitignore.

Intall all dependecies
    npm install
    

Edit the app/app.coffee file to connecto to your mongodb database

Run the dev env
===============

Run the coffee file watch command
    cake watch
    
Run the foreman server
    foreman start
    
Go to http://localhost:3000/


NOTE: 