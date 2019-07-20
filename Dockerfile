FROM ubuntu:19.04

RUN apt-get update && apt-get install -y ruby ruby-dev libffi-dev build-essential zlib1g-dev

RUN gem install jekyll-import
RUN gem install hpricot
RUN gem install open_uri_redirections
RUN gem install reverse_markdown

WORKDIR /home

ADD import.rb .
ADD html2md.rb .
ADD run.sh .

#ENTRYPOINT ["RUBYOPT=\"-KU -E utf-8:utf-8\"" "ruby" "import.rb"]
