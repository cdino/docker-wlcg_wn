FROM centos:6.7

MAINTAINER Miguel Gila <miguel.gila@cscs.ch>
LABEL Description="This image is used to test WLCG WN workloads via Docker" Vendor="CSCS" Version="0.4.1" URL="https://github.com/miguelgila/docker-wlcg_wn"

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

# Install dependencies
RUN yum -y install openssh-clients

# Install extra RPMs present in emi3wn-latest reference
RUN yum -y install a1_grid_env bouncycastle bouncycastle-mail canl-c canl-java ca-policy-egi-core CGSI-gSOAP classads cleanup-grid-accounts davix-libs dcache-srmclient dcap dcap-devel dcap-libs dcap-tunnel-gsi dcap-tunnel-krb dcap-tunnel-ssl dcap-tunnel-telnet dpm dpm-devel dpm-libs dpm-perl dpm-python editline emi.amga.amga-cli emi-release emi.saga-adapter.context-cpp emi.saga-adapter.isn-common emi.saga-adapter.isn-cpp emi.saga-adapter.sd-cpp emi-version emi-wn fetch-crl gfal gfal2 gfal2-all gfal2-devel gfal2-doc gfal2-plugin-dcap gfal2-plugin-file gfal2-plugin-gridftp gfal2-plugin-http gfal2-plugin-lfc gfal2-plugin-rfio gfal2-plugin-srm gfal2-plugin-xrootd gfal2-python gfal2-util gfalFS gfal-python ginfo glite-jobid-api-c glite-lb-client glite-lb-client-progs glite-lb-common glite-lbjp-common-gss glite-lbjp-common-trio glite-service-discovery-api-c glite-wms-brokerinfo-access glite-wms-brokerinfo-access-lib glite-wn-info glite-yaim-clients glite-yaim-core globus-callout globus-common globus-ftp-client globus-ftp-control globus-gass-copy globus-gass-copy-progs globus-gass-transfer globus-gsi-callback globus-gsi-cert-utils globus-gsi-credential globus-gsi-openssl-error globus-gsi-proxy-core globus-gsi-proxy-ssl globus-gsi-sysconfig globus-gssapi-error globus-gssapi-gsi globus-gss-assist globus-io globus-openssl-module globus-proxy-utils globus-xio globus-xio-gsi-driver globus-xio-popen-driver gridftp-ifce gridsite-libs gsoap is-interface jclassads lcgdm-devel lcgdm-libs lcg-info lcg-infosites lcg-ManageVOTag lcg-tags lcg-util lcg-util-libs lcg-util-python lfc lfc-devel lfc-libs lfc-perl lfc-python pugixml python-argparse SAGA.lsu-cpp.engine srm-ifce uberftp voms voms-api-java3 voms-clients3 voms-devel xerces-c
