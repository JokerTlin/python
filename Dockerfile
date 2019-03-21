FROM centos:7
ADD conf/ /
ADD software/ /
ADD install.sh /
RUN ["/bin/bash","-c","sh /install.sh"]
