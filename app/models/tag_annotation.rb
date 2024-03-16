class TagAnnotation < ApplicationRecord
  belongs_to :annotation
  belongs_to :tag
end
