require "bundler/bare_symlink/version"

require "tmpdir"
require "fileutils"

module Bundler
  module BareSymlink
    def self.call
      root_path = File.dirname(Bundler.default_gemfile)
      target_dir = File.join(
        root_path,
        '.bundle',
        'gems'
      )

      Dir.mktmpdir do |tmpdir|
        link_dir = File.join(tmpdir, 'gems')
        FileUtils.mkdir(link_dir)

        Bundler
          .load
          .specs
          .inject({}) { |result, spec| result[spec.name] = spec.full_gem_path; result }
          .reject { |name, gem_path| gem_path.start_with?(root_path) }
          .each do |name, gem_path|
            target = File.join(link_dir, name)
            FileUtils.ln_s(gem_path, target)
          end

        FileUtils.mkdir_p(File.dirname(target_dir))
        Bundler.ui.info("Symlinking bundled gems into #{target_dir}")
        FileUtils.rm_r(target_dir) if File.exist?(target_dir)
        FileUtils.cp_r(link_dir, target_dir)
      end
    end

    class Command
      Plugin::API.command('bare_symlink', self)

      def exec(name, args)
        BareSymlink.call
      end
    end
  end
end
