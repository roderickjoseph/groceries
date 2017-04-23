class List < ApplicationRecord
  include RankedModel

  validates :title, presence: true

  belongs_to :user
  has_many :items

  ranks :row_order
end
