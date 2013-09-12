class Season < ActiveRecord::Base

  has_many :games

  def self.current
    Season.order('created_at desc').first
  end
end
