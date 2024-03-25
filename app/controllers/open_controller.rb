require 'redcarpet'

# Controller that show content for public
class OpenController < ApplicationController
  def index
    @annotations = Annotation.where(active: true).order(created_at: :desc).limit(3)
  end

  def my_annotation
    @annotations = Annotation.where(active: true).order(created_at: :desc).page(params[:page])
  end

  def annotation_tags
    unless params[:type_tag]
      @tags = Tag.all
      @annotations = []
      return
    end

    @tags = Tag.all
    name_tag = params[:type_tag]
    index_tag = Tag.find_by(content: name_tag)
    @annotations =
      TagAnnotation
      .select('annotations.id', 'title', 'description', 'content', 'created_at')
      .joins(:annotation)
      .where(tag_id: index_tag, 'annotations.active': true)
  end

  def specific_annotation
    @annotation = Annotation.find_by(title: params[:title_post])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @content = markdown.render(@annotation.content)
  end
end
[]
