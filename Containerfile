FROM quay.io/kennasecurity/ruby:2.6.3-ubi
LABEL maintainer="Kenna Security"

USER root

RUN useradd kenna
RUN mkdir -p /opt/app/toolkit/
RUN mkdir -p /opt/app/bundle/bin
RUN chown -R kenna /opt/app-root/src
RUN chown -R kenna /opt/app/

# set up gem env
RUN gem install bundler:2.0.2

# add our files, ensure we can write to output
ADD . /opt/app/toolkit/

# install deps 
WORKDIR /opt/app/toolkit/
USER kenna
RUN bundle install

ENTRYPOINT ["./scripts/entrypoint.sh"]

CMD ["help"]
