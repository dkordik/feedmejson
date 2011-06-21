A simple node app to feed dummy json files from the current directory, with wide open access-control-allow-origin so you can snag the json programatically without security restrictions.

Place in directory with .json files. Run with `coffee feedmejson.coffee`

**Example requests**:

`http://localhost:1337/foo.json`

=> [foo.json]

`http://localhost:1337/foo.json?1234567890`

=> [foo.json]

