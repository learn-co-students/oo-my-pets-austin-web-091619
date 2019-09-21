class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []
  def initialize(name, owner)
    @name = name
    @owner = owner
    @species = "dog"
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
  
end