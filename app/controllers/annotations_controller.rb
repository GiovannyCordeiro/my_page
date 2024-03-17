class AnnotationsController < ApplicationController

  def index
    @annotations = Annotation.where(active: true)
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

  def edit
    @tags = Tag.all
    @annotation = Annotation.find(params[:id])
  end

  def update
    @annotation = Annotation.find(params[:id])
    if @annotation.update(annotation_params)
      # se atualizar manda tira todas as tags que ele tem e coloca as novas (melhorar isso dps)
      TagAnnotation.where(annotation_id: params[:id]).destroy_all
      tag_keys = params[:tags].keys
      tag_keys.each do |key_tag|
        TagAnnotation.create(annotation_id: @annotation.id, tag_id: key_tag)
      end
      # terminou de atulizar? joga para a outra rota!
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
