![GitHub Logo](https://github.com/gnea/gnea-Media/blob/master/Grbl%20Logo/Grbl%20Logo%20250px.png?raw=true)

![Build Status](https://travis-ci.org/ManiacalLabs/grbl.svg?branch=master)

This repo is mainly a playground for custom Grbl versions created by Maniacal Labs, based on the official [Grbl](https://github.com/gnea/grbl).
We try to keep this up to date with the latest from official Grbl, but there is no guarantee. 

The `configs` directory contains each custom version which are automatically built by Travis-CI, one per sub-directory. The contents of each directory is merged with the contents of the `grbl` directory and then built. 

At the end of the CI build process the compiled hex files along with the full source trees that built each are uploaded to the [`builds` branch](https://github.com/ManiacalLabs/grbl/tree/builds).

You can find the hex files in the `release` directory and the sources in the `code` directory of this `builds` branch.

Finally, this entire repo has been updated to include a `grbl.ino` file for not only the main `grbl` source directory but with each sub-config as mentioned above. This means that there is **no need** to install any of this as a library in order to compile. Simple grab the code for either the main config or for one of the custom configs and open its corresponding `grbl.ino` file. Then build and upload as you normally would.