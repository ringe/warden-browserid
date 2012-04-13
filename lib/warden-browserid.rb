require "warden-browserid/version"
require "warden-browserid/config"
require "warden-browserid/strategy"

Warden::Strategies.add(:browserid, Warden::BrowserId::Strategy)
