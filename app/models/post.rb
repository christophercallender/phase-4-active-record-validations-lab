class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :validate_title

  def validate_title
    if title.present?
      unless title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
        errors.add(:title, "not clickbait")
      end
    end
  end
end
