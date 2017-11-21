class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait? # regex version (/Won't Believe|Secret|Top [\d]| Guess/)

  def is_clickbait?
    if !(title && ["Won't Believe", "Secret", "Top", "Guess"].any? {|word| title.include?(word)})
      errors.add(:clickbait, "must be clickbait")
    end
  end

end
