class Noble
  attr_reader :name, :title
  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  private
  def gait
    "struts"
  end
end
