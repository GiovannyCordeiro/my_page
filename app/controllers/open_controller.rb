# Controller that show content for public
class OpenController < ApplicationController
  def index
    @annotations = Annotation.order(:created_at).limit(3)
  end
  def myAnotation
    @annotations = Annotation.all
  end
  def anotationTags
    @annotations = Annotation.all
  end
end
[]
