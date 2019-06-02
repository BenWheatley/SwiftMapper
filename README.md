# SwiftMapper

A Swift map model (and example renderer) for OpenStreetMap XML data.

Example data is Berlin-area public transport information. Uses pre-fetched data to avoid hammering the OSM servers. Map data licenced under ODbL (https://wiki.openstreetmap.org/wiki/Open_Database_License) and fetched from:

* http://www.overpass-api.de/api/xapi?way[bbox=12.9027,52.2867,13.8399,52.7579][public_transport=*] (`public-transport-data-berlin-xapi.xml`)
* http://www.overpass-api.de/api/xapi?way[bbox=12.9027,52.2867,13.8399,52.7579][railway=*] (`railway-data-berlin-xapi.xml`)
* http://www.overpass-api.de/api/xapi?node[bbox=12.9027,52.2867,13.8399,52.7579][historic=*] (`historican-nodes-in-berlin-ish-xapi.xml`)
* http://www.overpass-api.de/api/xapi?node[bbox=-117.832,14.104,-85.965,32.943][historic=*] (`historican-nodes-in-mexico-ish-xapi.xml`)

This is a macOS project, because it's been far too long since I last made something for the desktop.

Default output:

![Map preview](Berlin-public-transport-infrastructure.png?raw=true "Map preview")

Currently only knows about `way`a and `node`s, not `relation`s. Random hue for each way.
