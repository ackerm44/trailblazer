class List < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :trails

  def validate_unique_trail(trail)
    if list.trail.name.exists?
      trail.errors[:base] << "This trail already exists in this list"
    end
  end
end



#
# class GoodnessValidator < ActiveModel::Validator
#   def validate(record)
#     if record.first_name == "Evil"
#       record.errors[:base] << "This person is evil"
#     end
#   end
# end
#
# class Person < ApplicationRecord
#   validates_with GoodnessValidator
# end
