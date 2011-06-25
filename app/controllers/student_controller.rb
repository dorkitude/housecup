class StudentController < ApplicationController
  def index
    @houses = House.all
  end

  def stream
    @deltas = Delta.find(:all, :order => "created_at DESC").paginate :page => params[:page]
    #respond_with(@countries)
  end

end
