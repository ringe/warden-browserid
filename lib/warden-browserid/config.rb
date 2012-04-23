require 'warden'
module Warden
  # The browserid_url option can be one of the following:
  # * dev.diresworb.org for development
  # * diresworb.org     for beta
  # * browserid.org     for production
  class Config < Hash
    hash_accessor :browserid_url
  end
end
