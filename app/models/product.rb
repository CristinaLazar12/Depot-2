class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    validates :title, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
    }

    # Custom validator to ensure that the description has at least 10 words.
    validate :description_word_count
    private

    def description_word_count
        if description.blank?
            errors.add(:description, "description cannot be blank")
        else
            word_count = description.split.size
        
            if word_count < 2
                errors.add(:description, "must have at least 2 words")
            end
        end
    end
end

