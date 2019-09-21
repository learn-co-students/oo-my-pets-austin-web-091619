require 'cat'
require 'dog'

class Owner
  attr_reader :name, :species

  @@all = []
    def initialize(name)
      @name = name
      @species = "human"
      @@all << self
    end

    def say_species
      "I am a #{self.species}."
    end

    def self.all
      @@all
    end

    def self.count
      @@all.count
    end

    def self.reset_all
      @@all = []
    end

    def cats
      Cat.all.select { |cat| cat.owner == self }
    end

    def dogs
      Dog.all.select { |dog| dog.owner == self }
    end

    def buy_cat(cat_name)
      Cat.new(cat_name, self)
    end

    def buy_dog(dog_name)
      Dog.new(dog_name, self)
    end

    def walk_dogs
      my_dogs = self.dogs
      my_dogs.select { |d| d.mood = "happy" }
    end

    def feed_cats
      my_cats = self.cats
      my_cats.select { |c| c.mood = "happy" }
    end

    def sell_pets
      my_dogs = self.dogs
      my_cats = self.cats
      my_dogs.select do |pet| 
        pet.mood = "nervous"
         pet.owner = nil 
      end
      my_cats.select do |pet| 
        pet.mood = "nervous" 
        pet.owner = nil
      end
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
end
