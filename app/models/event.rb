class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attends, dependent: :destroy
  has_many :users_attending, through: :attends, source: :user
  has_many :comments, dependent: :destroy
  validates :name, :date, :city, :state, presence: true
end
