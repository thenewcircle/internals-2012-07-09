#!/bin/bash

function dup(){ 
	part=${PWD:${#FROM}}
	mkdir -p $TO/device/$part && cp $1 $TO/device/$part
}
