## Symlink your bundled gems

This gem adds a Bundler hook to automatically add a symlink to each gem
in the `.bundle/gems/` directory in your project. It's a clone of the
[bundler-symlink plugin](https://github.com/petekinnecom/bundler-symlink) but uses
bare gem names without versions as the symlink names.

It also adds a command to run `bundle bare_symlink` if you prefer to run it manually.

## Installation

Install the gem:

`gem install bundler-bare_symlink`

Register the plugin with Bundler:

Globally:

`cd ~ &&  bundle plugin install bundler-bare_symlink`

Per project:

`cd /path/to/project && bundle plugin install bundler-bare_symlink`


## Uninstall

`bundler plugin uninstall bundler-bare_symlink`

## Why?

Read the [corresponding README section](https://github.com/petekinnecom/bundler-symlink?tab=readme-ov-file#why)
in the original plugin for a general answer.

But why symlinks with bare names? This is handy whenever you need to reference a gem path regardless of its version.

One particular use case is the [`@source` clause](https://tailwindcss.com/docs/detecting-classes-in-source-files#explicitly-registering-sources) in Tailwind 4.
If you need to `@source` classes from inside a gem into a project's Tailwind configuration,
you can use this plugin and reference the gem inside the main Tailwind CSS file like this:

```css
/* app/assets/tailwind/application.css */

/* the path is relative to the CSS file */
@source "../../../.bundle/gems/some_gem/**/*.rb";
```

Such config can easily be shared with your teammates and does not have to be updated during gem upgrades.

Example:

```
: ls .bundle/gems/ | head
total 0
drwxr-xr-x  430 pete  staff    13K Mar 12 13:35 .
drwxr-xr-x    4 pete  staff   128B Mar 12 13:35 ..
lrwxr-xr-x    1 pete  staff    80B Mar 12 13:35 actioncable -> /Users/pete/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/actioncable-5.2.1
lrwxr-xr-x    1 pete  staff    81B Mar 12 13:35 actionmailer -> /Users/pete/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/actionmailer-5.2.1
lrwxr-xr-x    1 pete  staff    79B Mar 12 13:35 actionpack -> /Users/pete/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/actionpack-5.2.1
lrwxr-xr-x    1 pete  staff    90B Mar 12 13:35 actionpack-xml_parser -> /Users/pete/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/actionpack-xml_parser-2.0.1
```

Awesome.

### Credits

Thanks Pete Kinnecom for the original plugin.

### License

WTFPL : http://www.wtfpl.net/txt/copying/
