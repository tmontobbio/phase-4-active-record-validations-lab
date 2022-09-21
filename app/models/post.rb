class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, length: {minimum: 250}

    # validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    # or
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    


    validate :title_is_clickbait

    def title_is_clickbait
        regex = /Top \d/
      unless title.match?(/Top \d/) || title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess")
        errors.add()
      end
    end

end