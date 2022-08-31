class Post < ApplicationRecord
    validates :title, presence:true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :title_is_clickbait

    def title_is_clickbait
        unless title.include?("Top")
            errors.add(:title, "Not a good title")
        end
    end


    #def sufficient_clickbait
    #    unless title.include?("Top") | title.incldue?("Won't Believe") | title.include?("Secret") | title.include?("Top \d")
    #        errors.add(:title, "Not a good title")
    #    end
    #end
end
