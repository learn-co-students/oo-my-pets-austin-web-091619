class Cat
  
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []
  def initialize(name, owner)
    @name = name
    @owner = owner
    @species = "cat"
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
  
end