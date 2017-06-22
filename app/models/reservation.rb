class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates_presence_of :check_in, :check_out, :total_price
  validate :same_period
  validate :check_in_less_check_out
  
  private
  
  def same_period
    @reservation = Reservation.where(room_id: room_id)
    @reservation.each do |reservation|
      if (check_in.to_date >= reservation.check_in && check_in.to_date <= reservation.check_out) || (check_out.to_date <= reservation.check_in && check_out.to_date <= reservation.check_out)
        errors.add(:check_in, "Period not available")
        errors.add(:check_out, "Period not available")
      end
    end
  end
  
  def check_in_less_check_out
    if check_in.to_date >= check_out.to_date
      errors.add(:check_in, "must be less than check out")
    end
  end
end
