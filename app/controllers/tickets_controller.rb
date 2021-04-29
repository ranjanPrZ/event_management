class TicketsController < ApplicationController
  before_action :authorize!
  
	def gender_based_discount
  	discount = current_user.gender=="Female" ? 0.5 : 0
  	respond_to do |format|
      format.json {render json: discount}
    end
  end

  def token_generator
    TokenMailer.send_token(current_user, params[:tok_num]).deliver_later
  	respond_to do |format|
      format.json {render json: {status: 200} }
    end
  end
end
