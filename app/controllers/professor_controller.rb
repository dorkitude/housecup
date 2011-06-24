class ProfessorController < ApplicationController
  before_filter :login_required 

  def new_delta_form
    @houses =House.all


  end

  def new_delta_post
  end

end
