class ProfessorController < ApplicationController
  before_filter :login_required 

  def new_delta_form
    @houses =House.all

    @my_params = {  
      :direction => params[:direction] || 'plus',
      :points => params[:points] ||  '',
      :house => params[:house] || 0,
      :why => params[:why] || '',
    }

  end

  def new_delta_post
  
    quantity = params[:points].to_i

    # set the 'type' parameter depending on merit vs demerit 
    if params[:direction] == 'minus'
      type = 'demerit'
    else
      type = 'merit'
    end 

    # handle the case where he didn't enter a quantity
    if quantity <= 0
      flash[:error] = "<img src='/images/dolores.png' />You sadistic cunt, you fat-fingered that submit button before entering a quantity.".html_safe
    end

    # handle the case where he didn't enter a reason
    if not flash[:error] and params[:why].length <= 0

      flash[:error] = "<img src='/images/severus.png' /> Severus... perhaps you wanted to specify a reason for this demerit so as not to invite accusations of favoritism.".html_safe
    end

    # handle the case where he forgot to select a house
    if not flash[:error] and params[:house].to_i == 0
      flash[:error] = "<img src='/images/hat.png' /> House selection is not optional. Choose wisely.".html_safe
    end

    if flash[:error]
      return redirect_to params.merge! :action => :new_delta_form
    end

    if type == 'demerit'
      quantity = 0 - quantity
    end


    house = House.find(params[:house])
    house.score = house.score.to_i + quantity
    house.save

    d = Delta.new
    d.why = params[:why]
    d.quantity = quantity
    d.house_id = params[:house]
    d.save

    puts d.to_json

    flash[:success] = "Successfully saved this thang: " + d.to_json
  end

end
