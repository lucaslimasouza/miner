# README

## Ruby EXIF reader
A command line application that recursively reads all of the images from the supplied directory of images, extracts their EXIF GPS data. So export this information for CSV/HTML file.

## Installation Instructions

You will require [Ruby](https://www.ruby-lang.org/en/downloads/) installed to use this program.

If you don't have bundler installed you will have to do so with `gem install bundle`.

Dependencies

- [Exif](https://github.com/tonytonyjan/exif)

And then run command below to install project dependencies.

```sh
$ bundle install
```

## To run script

```sh
Usage: app.rb [options]
    -f, --format=FORMAT              # File"s format to output => csv or html.
                                     # Default: csv
    -d, --directory=DIRECTORY        # Especify a directory to load images.

```
You can run script with one of this commands below:

### default command

```sh
ruby ./app.rb

```
### with Options
Choose file's output format => csv or html ex:

```
$ ruby ./app.rb --format html
```

With a new diretory of images ex:

```
$ ruby ./app.rb --directory you_custom_directory
```

## To run tests

The tests were defined with Rspec so to get the tests run command below

```sh
$ rspec
```
