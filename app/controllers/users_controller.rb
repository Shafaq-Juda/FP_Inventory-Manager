class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
   render{ :index }
  end

end
