# latex-docker

Dockerfile to create an image with texlive-full and pandoc


A common use of the image looks like this (linebreaks for readability):

docker run --rm \
       --volume "$(pwd):/data" \
       --user $(id -u):$(id -g) \
       mjunold/latex README.md -o outfile.epub


For frequent command line use, we suggest the following shell alias:

alias pandock=\
'docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) pandoc/latex'


Mac/Linux

docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" mjunold/latex latexmk -outdir=/tmp -pdf /tmp/foo.tex

Windows

In cmd:

docker run --rm -t --net=none -v "%cd%:/tmp" leplusorg/latex latexmk -outdir=/tmp -pdf /tmp/foo.tex

In PowerShell:

docker run --rm -t --net=none -v "${PWD}:/tmp" leplusorg/latex latexmk -outdir=/tmp -pdf /tmp/foo.tex

Help

To know more command-line options of latexmk:

docker run --rm --net=none leplusorg/latex latexmk -h
