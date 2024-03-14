class AnnotationsController < ApplicationController

  def new
    @annotation = Annotation.new
  end

end
