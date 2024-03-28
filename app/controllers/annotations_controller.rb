class AnnotationsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @annotations = Annotation.where(active: true).order(created_at: :desc)
  end

  def new
    @annotation = Annotation.new
    @tags = Tag.all
  end

  def create
    @annotation = Annotation.new(annotation_params)
    if @annotation.save
      tag_keys = params[:tags].keys
      tag_keys.each do |key_tag|
        TagAnnotation.create(annotation_id: @annotation.id, tag_id: key_tag)
      end

      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @tags = Tag.all
    @annotation = Annotation.find(params[:id])
  end

  def update
    @annotation = Annotation.find(params[:id])
    if @annotation.update(annotation_params)
      TagAnnotation.where(annotation_id: params[:id]).destroy_all
      tag_keys = params[:tags].keys
      tag_keys.each do |key_tag|
        TagAnnotation.create(annotation_id: @annotation.id, tag_id: key_tag)
      end
      redirect_to my_annotations_path
    else
      render :edit
    end
  end

  def destroy
    annotation = Annotation.find(params[:id])
    annotation.update_column(:active, false)
  end

  private

  def annotation_params
    params.require(:annotation).permit(:title, :description, :content)
  end

end
