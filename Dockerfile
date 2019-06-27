FROM centos:7
ADD conf/ /conf
ADD software/ /software
ADD install.sh /
RUN ["/bin/bash","-c","sh /install.sh >test.log"]
