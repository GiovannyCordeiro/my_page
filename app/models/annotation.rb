class Annotation < ApplicationRecord
  has_many :tag_annotations
  has_many :tags, through: :tag_annotations
end
