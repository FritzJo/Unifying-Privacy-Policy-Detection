FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

RUN sed -i'' 's/archive\.ubuntu\.com/us\.archive\.ubuntu\.com/' /etc/apt/sources.list
RUN apt-get clean -qq \
    && rm -r /var/lib/apt/lists/* -vf \
    && apt-get clean -qq \
    && apt-get update -qq \
    && apt-get upgrade -qq \
    && apt-get install wget git make -qq \
    && apt-get install libgtk-3-0 libx11-xcb1 libdbus-glib-1-2 libxt6 xvfb -qq

RUN git clone https://github.com/openwpm/OpenWPM.git /opt/OpenWPM
RUN cd /opt/OpenWPM

ENV HOME /opt
RUN cp scripts/install-miniconda.sh .
RUN ./install-miniconda.sh
ENV PATH $HOME/miniconda/bin:$PATH

# Install OpenWPM
WORKDIR /opt/OpenWPM
COPY . .
RUN ./install.sh
ENV PATH $HOME/miniconda/envs/openwpm/bin:$PATH

# Install crawling script
RUN mv firefox-bin /opt/firefox-bin
ENV FIREFOX_BINARY /opt/firefox-bin/firefox-bin

WORKDIR /app
COPY environment.yml .
RUN conda env create -f environment.yml

SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]

COPY *.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "myenv", "python", "demo_privacy_policy_download.py"]
