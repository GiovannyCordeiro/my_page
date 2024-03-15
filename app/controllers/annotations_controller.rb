class AnnotationsController < ApplicationController

  def index
    @annotations = Annotation.all
  end

  def new
    @annotation = Annotation.new
    @tags = Tag.all
  end

  def create
    @annotation = Annotation.new(annotation_params)
    if @annotation.save
      # colocando tags
      tag_keys = params[:tags].keys
      tag_keys.each do |key_tag|
        TagAnnotation.create(annotation_id: @annotation.id, tag_id: key_tag)
      end

      redirect_to root_path
    else
      render :new
    end
  end

  private

  def annotation_params
    params.require(:annotation).permit(:title, :description, :content)
  end

end
