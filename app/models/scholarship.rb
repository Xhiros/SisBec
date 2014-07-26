class Scholarship < ActiveRecord::Base
  belongs_to :student
  belongs_to :scholarshipPetition
end
