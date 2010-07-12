class TranslationsController < ApplicationController

  before_filter :param_string_blank, :only => [:search]

  # GET /search/
  # GET /search/id
  def search

    @results ||= Translation.find_fuzzy_translations_for(@string_to_search, params[:non_free])

    respond_to do |format|
      format.html # show.html.erb
      format.tbx  { render :xml => @translation }
    end
  end

  private

  def param_string_blank

    @string_to_search = params[:string].strip

    if ( (@string_to_search.blank?) or (@string_to_search.length < 2) )
        logger.info "Redirixindo a root_url xa que params string é '"+params[:string].to_s+"'";
        redirect_to root_url	
    end

  end
end
