namespace :cats do
  desc "Downloads and tags new cats from edgecats.net"
  task :herd => :environment do
    logger = Logger.new $stderr
    Cat::Herder.new("http://edgecats.net", "all", logger: logger).sync
  end
end
