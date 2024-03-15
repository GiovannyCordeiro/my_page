class AnnotationsController < ApplicationController

  def new
    @annotation = Annotation.new
  end

  def create
    @tags = params[:tags]
    logger.info "Mensagem informativa #{params[:tags]}"
  end

end
