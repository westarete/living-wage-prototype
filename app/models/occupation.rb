class Occupation < ActiveRecord::Base
  attr_accessible :geography, :occ_salary, :occ_type

  belongs_to :explainable, polymorphic: true

end
