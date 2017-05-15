require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  phantomjs_path = if RUBY_PLATFORM['x86_64-darwin']
                     Rails.root.join('bin', 'phantomjs-osx').to_s
                   elsif RUBY_PLATFORM['x86_64-linux']
                     Rails.root.join('bin', 'phantomjs-linux-64').to_s
                   else
                     raise "Can't load PhantomJS for OS: #{RUBY_PLATFORM}"
                   end

  options = {
      phantomjs: phantomjs_path,
      phantomjs_logger: Logger.new('/dev/null'),
      phantomjs_options: %w[--load-images=no --ignore-ssl-errors=yes],
      js_errors: false,
      timeout: 90
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 1
