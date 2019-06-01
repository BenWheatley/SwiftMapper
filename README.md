# SwiftMapper

A Swift map model (and example renderer) for OpenStreetMap XML data.

Example data is Berlin-area public transport information. Uses pre-fetched data to avoid hammering the OSM servers. Map data licenced under ODbL (https://wiki.openstreetmap.org/wiki/Open_Database_License).

This is a macOS project, because it's been far too long since I last made something for the desktop.

Default output:

![Map preview](Berlin-public-transport-infrastructure.png?raw=true "Map preview")

Currently only knows about `way`a and `node`s, not `relation`s. Random hue for each way.
