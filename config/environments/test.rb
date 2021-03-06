require "active_support/core_ext/integer/time"

# The test environment is used exclusively to run your application's
# test suite. You never need to work with it otherwise. Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs. Don't rely on the data there!

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = false
  config.action_view.cache_template_loading = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Store uploaded files on the local file system in a temporary directory.
  config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true
  ENV['GOOGLE_OAUTH_CLIENT_ID'] = '468360085787-e1goacd7lr32omi2j29ffemlug4ck1u3.apps.googleusercontent.com'
  ENV['GOOGLE_OAUTH_CLIENT_SECRET'] = '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'
  
  OmniAuth.config.test_mode = true
  OmniAuth.config.allowed_request_methods += %i[get]
  OmniAuth.config.mock_auth[:google_user] = OmniAuth::AuthHash.new({
    provider: 'google_oauth2',
    uid: '123456789',
    info: {
      name: 'Jane Doe',
      email: 'JaneDoe@tamu.edu',
      first_name: 'Jane',
      last_name: 'Doe',
      avatar_url: "mock_url",
      uid: "123456789"
    },
    credentials: {
      token: 'token1',
      refresh_token: 'rtoken1',
      expires_at: 1_354_920_555,
      expires: true
    }
  })


end
