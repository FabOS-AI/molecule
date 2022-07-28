ARG MOLECULE_VERSION=4.0.1
FROM python:3.9

ARG MOLECULE_VERSION

RUN git config --global credential.helper store
RUN apt update && apt install -y docker.io sshpass libguestfs-tools libvirt-dev virtinst
RUN python3 -m pip install \
    molecule==$MOLECULE_VERSION \
    molecule[docker]==$MOLECULE_VERSION \
    ansible \
    jmespath

CMD /bin/sh -c /bin/bash