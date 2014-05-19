class Cat < ActiveRecord::Base
  has_many :cat_requests, as: :requests

  def self.fetch url
    cat = where(url: url).first_or_create
    cat.download!
  end

  def self.choose
    offset(rand count).first
  end

  def download!
    return if File.exists? download_path
    File.open download_path, "wb" do |f|
      f.write HTTParty.get(url).parsed_response
    end
  end

  def image_path
    URI(url).path.sub /^\//, '' # Remove leading /
  end

  def download_path
    Rails.root.join "public", image_path
  end
end
