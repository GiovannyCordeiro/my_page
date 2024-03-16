class Tag < ApplicationRecord
  has_many :tag_annotations
  has_many :annotations, through: :tag_annotations
end
