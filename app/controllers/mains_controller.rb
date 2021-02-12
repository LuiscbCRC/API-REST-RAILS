# frozen_string_literal: true

class MainsController < ApplicationController
  def index
    redirect_to rswag_ui_path
  end
end
