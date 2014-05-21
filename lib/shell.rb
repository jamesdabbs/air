class Shell
  attr_reader :history

  def initialize limit: 100
    @history, @limit = [], limit
  end

  def run cmd
    record cmd
    system cmd unless Rails.env.test?
  end

  def record cmd
    @history.shift if @history.length == @limit
    @history << cmd
  end
end
