require 'rubygems'
require 'bundler'

Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'mairies'

Townhall.new.scrap