class HtmlContentsController < ApplicationController

  # GET /html_contents
  def index
    @html_contents = HtmlContent.all

    render json: @html_contents
  end

  # POST /html_contents
  def create
    @html_content = HtmlContent.new(html_content_params)

    if @html_content.save
      render json: @html_content, status: :ok
    else
      render json: @html_content.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def html_content_params
      params.require(:html_content).permit(:link, :content)
    end
end
