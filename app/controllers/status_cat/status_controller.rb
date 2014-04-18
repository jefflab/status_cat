class StatusCat::StatusController < ApplicationController

  before_filter :_authenticate!
  before_filter :_authorize!

  def index
    @checkers = StatusCat::Status.all
  end

  private

  def _authenticate!
    instance_eval(&StatusCat.config.authenticate_with)
  end

  def _authorize!
    instance_eval(&StatusCat.config.authorize_with)
  end

end