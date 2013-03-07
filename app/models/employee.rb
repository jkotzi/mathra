class Employee < ActiveRecord::Base
  attr_accessible :login, :name, :surname

  # I do not know if I need the following..... should check a before delete to see... its better
  #has_many :rowempls, :dependent => :destroy

  def Fullname
    return self.surname + " " + self.name
  end
end
