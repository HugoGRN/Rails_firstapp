class Article < ActiveRecord::Base
    belongs_to :user

    validates :title, presence: true, length: {minimum: 10, maximum: 50}

    validates :description, presence: true, length: {minimum: 30, maximum: 500}

    validates :user_id, presence: true

end