class UsersController < ApplicationController
  load_and_authorize_resource only: :show
end
