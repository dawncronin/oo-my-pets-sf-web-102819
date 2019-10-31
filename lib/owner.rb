require_relative 'cat.rb'
require_relative 'dog.rb'
class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all= []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
    new_dog
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood=("happy")}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood=("happy")}
  end

  def sell_pets
    self.cats.each do |cat| 
      cat.mood=("nervous")
      cat.owner=(nil)
    end
    self.dogs.each do |dog|
      dog.mood=("nervous")
      dog.owner=(nil)
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
  end
end