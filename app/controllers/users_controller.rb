class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :destroy, :edit]
  load_and_authorize_resource only: :show
end
