FROM debian:trixie

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	make \
	libbusiness-isbn-perl \
	libcapture-tiny-perl \
	libcpanel-json-xs-perl \
	libdatetime-perl \
	libfile-slurp-perl \
	libmarc-record-perl \
	libmarc-xml-perl \
	libmodule-build-tiny-perl \
	libmodule-pluggable-perl \
	libreadonly-perl \
	libsub-uplevel-perl \
	libtest-exception-perl \
	libtest-mockobject-perl \
	libtest-nowarnings-perl \
	libtest-output-perl \
	libtest-warn-perl \
	libunicode-utf8-perl \
	libuniversal-can-perl \
	cpanminus \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
RUN cpanm App::MARC::Validator

RUN mkdir /output/
RUN dpkg-query -W -f='${Package} ${Version} ${Installed-Size}\n' > /output/installed_packages

WORKDIR /work

ENTRYPOINT ["/usr/bin/bash"]
