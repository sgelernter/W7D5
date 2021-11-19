class Sub < ApplicationRecord

    validates :title, :moderator_id, presence: true 
    validates :title, uniqueness: true 

    belongs_to :moderator, 
    class_name: :User, 
    primary_key: :id, 
    foreign_key: :moderator_id 

end
