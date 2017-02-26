class PagesController < ApplicationController
  def index
    @pages = %w{users circuits articles effect_types}
  end
end
