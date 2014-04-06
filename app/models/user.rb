class User < ActiveRecord::Base
#  validates_presence_of :name
  validates_length_of :name, :in => (1..20), :allow_nil => false
  #validates :name, length: { maximum: 20 }
end
