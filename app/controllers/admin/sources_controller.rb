class Admin::SourcesController < ApplicationController

  def import
    @importer = Admin::Source::Importer.new(admin_source_params)
    respond_to do |format|
      if @importer.import
        format.html { redirect_to events_path, flash: { success: render_to_string(layout: false) } }
        format.xml  { render xml: @importer.admin_source, events: @importer.events }
      else
        format.html { redirect_to new_admin_source_path(url: @importer.admin_source.url), flash: { failure: @importer.failure_message } }
        format.xml  { render xml: @importer.admin_source.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @source = Admin::Source.new
    @source.url = params[:url] if params[:url].present?
  end
  
    private

    def admin_source_params
      params.require(:admin_source).permit(:title, :url, :imported_at, :reimport)
    end

end