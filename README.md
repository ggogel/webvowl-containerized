# webvowl-containerized

A container image for [WebVOWL](http://vowl.visualdataweb.org/webvowl.html).

## Usage 

Run the image in a Docker container:

`docker run --rm -d -p 8080:8080 ggogel/webvowl:latest`

Then access `http://localhost:8080` through your browser.

## Build

Clone the repository and then run:

`docker build .`
