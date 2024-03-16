# Controller that show content for public
class OpenController < ApplicationController
  def index
    @annotations = Annotation.order(:created_at).limit(3)
  end

  def myAnotation
    @annotations = Annotation.all
  end

  def anotationTags
    if !params[:type_tag]
      @tags = Tag.all
      @annotations = []
      return
    end

    @tags = Tag.all
    name_tag = params[:type_tag]
    index_tag = Tag.where(content: name_tag)[0][:id]
    @annotations =
      TagAnnotation
      .select('annotations.id', 'title', 'description', 'content', 'created_at')
      .joins(:annotation)
      .where(tag_id: index_tag)
  end
end
[]
