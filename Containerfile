FROM quay.io/kennasecurity/ruby:2.6.3-ubi
LABEL maintainer="Kenna Security"

USER root

RUN useradd -g root kenna
RUN mkdir -p /opt/app/toolkit/
RUN mkdir -p /opt/app/bundle/bin
ADD . /opt/app/toolkit/
RUN chown -R kenna /opt/

# set up gem env


# install deps 
WORKDIR /opt/app/toolkit/
USER kenna
RUN gem install bundler:2.0.2
RUN bundle install

VOLUME [ "/opt/app/toolkit/input" ]
VOLUME [ "/opt/app/toolkit/output" ]

ENTRYPOINT ["./scripts/entrypoint.sh"]`