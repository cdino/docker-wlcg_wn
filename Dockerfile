FROM centos:6

MAINTAINER Miguel Gila <miguel.gila@cscs.ch>
LABEL Description="This image is used to test WLCG WN workloads via Docker" Vendor="CSCS" Version="0.4" URL="https://github.com/miguelgila/docker-wlcg_wn"

ADD rc.local /etc/rc.d/rc.local
ADD http://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo /etc/yum.repos.d/

VOLUME /cvmfs

RUN yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-2-5.noarch.rpm \
http://linuxsoft.cern.ch/wlcg/sl6/x86_64/wlcg-repo-1.0.0-1.el6.noarch.rpm \
http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/x86_64/base/emi-release-3.0.0-2.el6.noarch.rpm

RUN yum -y install epel-release cvmfs HEP_OSlibs_SL6 wlcg-voms-alice wlcg-voms-atlas wlcg-voms-lhcb \
wlcg-voms-cms wlcg-voms-ops autofs ca-policy-egi-core iputils

RUN yum -y install emi-slurm-client emi-wn emi-glexec_wn \
globus-proxy-utils globus-gass-copy-progs 

# Done afterwards because EMI-3 has an older version and, for this particular meta package, we want
# the latest release available
RUN yum -y --disablerepo=EMI* install nordugrid-arc-client

#ENTRYPOINT ["/bin/bash"]

