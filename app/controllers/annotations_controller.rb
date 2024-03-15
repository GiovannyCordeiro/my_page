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
      redirect_to root_path
    else
      render :new
    end
    logger.info "Mensagem informativa #{params[:tags]}"
  end

  private

  def annotation_params
    params.require(:annotation).permit(:title, :description, :content)
  end

end
