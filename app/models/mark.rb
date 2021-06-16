class Mark < ActiveRecord::Base
  belongs_to :product
  validates_numericality_of :points, less_than: 101, greater_than_or_equal_to: 0

  def letter
    if points < 60
      return "F"
    end
    if points >= 60 && points < 75
      return "C"
    end
    if points >= 75 && points < 90
      return "B"
    end
    if points >= 90
      "A"
    end
  end
end
