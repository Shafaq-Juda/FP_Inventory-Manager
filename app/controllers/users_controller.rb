class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
   render(:index)
  end

end
