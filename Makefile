IMAGE=marc-validator-cpan
all: build
build:
	docker build -t ${IMAGE} .
	docker run -t -v `pwd`/output:/mnt/output --entrypoint=/bin/bash ${IMAGE} -c "cp /output/installed_packages /mnt/output/"
run: build
	docker run -v "`pwd`":/work -it $(IMAGE)
