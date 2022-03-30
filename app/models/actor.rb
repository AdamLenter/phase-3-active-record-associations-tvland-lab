class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    roles = self.characters
    
    list_of_roles = []

    roles.each do |role|
        list_of_roles << "#{role.name} - #{role.show.name}"
    end
    list_of_roles
  end
end