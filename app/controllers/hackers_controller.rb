class HackersController < ApplicationController
  before_action :authenticate_hacker!
  def show
  end

  def update
	  if current_hacker.update(hacker_params)
	    render :show, notice: 'Information was successfully updated.'
	  else
	    render :show, error: 'Information was not successfully updated.'
	  end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def hacker_params
      params.require(:hacker).permit(:language_ids)
    end
end
