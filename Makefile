# Run this is you don't have rbenv or bundler installed yet.
# After installing rbenv, you will need to open a new terminal tab.
# After installing ruby, you will need to open a new terminal tab.
setup:
	brew install rbenv ruby-build && \
	rbenv install && \
	bundle install

install:
	bundle install

run:
	bundle exec jekyll serve
