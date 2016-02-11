FROM klaemo/couchdb

ENV COUCH_SRC /usr/src/couchdb

WORKDIR /usr/src
RUN curl -fSL https://github.com/couchbase/geocouch/archive/couchdb1.3.x.tar.gz -o geocouch.tar.gz \
  && mkdir geocouch \
  && tar xzf /usr/src/geocouch.tar.gz -C /usr/src/geocouch --strip-components=1
WORKDIR /usr/src/geocouch
RUN make
ENV ERL_FLAGS="+A 4 -pa /usr/src/geocouch-couchdb1.3.x/ebin"
