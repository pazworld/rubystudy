#!/bin/sh
IMAGE=my/rails-tutorial

docker run -it --rm --name railsdev \
	--user rails \
	-p 3000:3000 \
	-v $PWD:/workspace \
	$IMAGE /bin/sh
