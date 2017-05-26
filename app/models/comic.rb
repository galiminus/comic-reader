class Comic < ApplicationRecord
  has_many :pages

  validates :title, presence: true
  validate :has_at_least_one_page

  def has_at_least_one_page
    errors.add(:page_ids, "is empty") unless pages.length > 0
  end
end
