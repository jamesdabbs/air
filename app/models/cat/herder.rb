class Cat
  class Herder
    def initialize host, endpoint, logger: nil
      @host, @endpoint = host, endpoint
      @logger = logger || Rails.logger
    end

    def sync
      fetch_manifest
      download_new
    end

    private

    def fetch_manifest
      @logger.info "Fetching manifest"
      doc = Nokogiri::HTML(HTTParty.get "#{@host}/#{@endpoint}")
      @manifest = doc.css('a').map { |link| "#{@host}/#{link.content}" }
    end

    def download_new
      present = Cat.pluck :url
      missing = @manifest - present
      @logger.info "Downloading #{missing.length} cats"
      missing.each_with_index do |url,i|
        @logger.debug "(#{i}/#{missing.length}): #{url}"
        Cat.fetch url
      end
    end
  end
end
