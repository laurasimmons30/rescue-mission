class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, uniqueness: true
end
