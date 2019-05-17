FROM cern/cc7-base:latest

MAINTAINER Miguel Gila <miguel.gila@cscs.ch>
LABEL Description="This image is used to test WLCG ATLAS WN workloads via Docker" Vendor="CSCS" Version="cc7_atlas_20190517" 

RUN yum -y install http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-repo-1.0.0-1.el7.noarch.rpm
## Make it install also A-REX downloader that is required if ARC tells CNs to do staging ##
RUN yum -y install HEP_OSlibs nordugrid-arc-arex nordugrid-arc-client time which

## dteam VO ##
RUN mkdir -p /etc/grid-security/vomsdir/dteam
COPY etc/grid-security/vomsdir/dteam/voms2.hellasgrid.gr.lsc /etc/grid-security/vomsdir/dteam/voms2.hellasgrid.gr.lsc
COPY etc/grid-security/vomsdir/dteam/voms.hellasgrid.gr.lsc /etc/grid-security/vomsdir/dteam/voms.hellasgrid.gr.lsc
COPY etc/vomses/dteam-voms2.hellasgrid.gr  /etc/vomses/dteam-voms2.hellasgrid.gr
COPY etc/vomses/dteam-voms.hellasgrid.gr  /etc/vomses/dteam-voms.hellasgrid.gr

RUN rm -rf {/var/empty,/tmp,/var/tmp,/opt}

VOLUME /cvmfs
VOLUME /cvmfs/atlas.cern.ch
VOLUME /cvmfs/atlas-condb.cern.ch
VOLUME /cvmfs/atlas-nightlies.cern.ch
VOLUME /cvmfs/cms.cern.ch
VOLUME /cvmfs/grid.cern.ch
VOLUME /cvmfs/lhcb.cern.ch
VOLUME /cvmfs/lhcb-condb.cern.ch
VOLUME /cvmfs/sft.cern.ch

#### DONE #####
