class PagesController < ApplicationController
  def index
    @pages = %w{users circuits articles}
  end
end
