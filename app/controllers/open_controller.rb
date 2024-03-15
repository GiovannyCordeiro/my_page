# Controller that show content for public
class OpenController < ApplicationController
  def index
    @annotations = Annotation.all
  end
  def myAnotation
    @annotations = Annotation.all
  end
  def anotationTags
    @annotations = Annotation.all
  end
end
[]
