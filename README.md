The `builds` branch contains both pre-built hex files as well as assembled source files generated by the configs in the `master` branch of this repo.

## Pre-compiled hex files

The [`release`](https://github.com/ManiacalLabs/grbl/tree/builds/release) directory contains pre-compiled hex files for each of the configs defined in the [master branch `configs`](https://github.com/ManiacalLabs/grbl/tree/master/configs) directory.

These files may be uploaded directly to any ATMega328 based hardware using a tool such as [XLoader](https://github.com/ManiacalLabs/grbl/blob/master/XLoader.zip) or via avrdude directly.

## Build Sources

The [`code`](https://github.com/ManiacalLabs/grbl/tree/builds/code) directory contains the build sources based on the modifications in the [configs](https://github.com/ManiacalLabs/grbl/tree/master/configs) directory in the master branch. When the Travis CI runs, these directories are automatically created based on that folder structure and builds the pre-compiled hex files mentioned above.

These aggregates sources are provided so that you can use them as a starting point or build and upload directly from the Arduino IDE. Simply clone this repo and switch to the `builds` branch or download this branch's [Zip file](https://github.com/ManiacalLabs/grbl/archive/builds.zip) then browse to the [`code`](https://github.com/ManiacalLabs/grbl/tree/builds/code) directory.

From there, each sub-directory will have a `grbl` directory inside of which is a `grbl.ino` file. Simply open that up with the Arduino IDE and you can work as normal.

Unlike with a normal Grbl build process there is absolutely no need to install any of this as a library. Just load as above, build, and upload to your board. That's it!