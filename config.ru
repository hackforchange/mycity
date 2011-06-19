# This file is used by Rack-based servers to start the application.
use Rack::Static, :urls => ["/stylesheets/compiled"], :root => "tmp"

require ::File.expand_path('../config/environment',  __FILE__)
run Mycity::Application


