require 'cat'
require 'dog'

class Owner
  attr_reader :name, :species, :cat
  

  @@all = []
  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.count
    return self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    myDogs = Dog.all.select{|dog| dog.owner == self}
    myDogs.each{|dog| dog.mood = 'happy'}
  end

  def feed_cats
    myCats = Cat.all.select{|cat| cat.owner == self}
    myCats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    myDogs = Dog.all.select do |dog|
     dog.mood = "nervous" 
     dog.owner = nil
    end 

    myCats = Cat.all.select do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    myDogs = Dog.all.select{|dog| dog.owner == self}
    myCats = Cat.all.select{|cat| cat.owner == self}
    
    "I have #{myDogs.count} dog(s), and #{myCats.count} cat(s)."
  end

end