require "bundler"
require "bundler/bare_symlink"

Bundler::Plugin.add_hook('after-install-all') do |_dependencies|
  Bundler::BareSymlink.call
end
