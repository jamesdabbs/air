Rails.application.configure do
  config.shell = Shell.new
end

module Air
  def self.shell
    Rails.application.config.shell
  end
end
