class StudentController < ApplicationController
  def index
    @houses = House.all
  end

end
