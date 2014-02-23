class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
  end

  def create
    params[:participant].each_key do |k|
      if params[:participant][k].is_a?(Array)
        params[:participant][k] = params[:participant][k].join(' | ')
      end
    end
    @participant = Participant.create!(params[:participant])
    redirect_to root_url
  end
end
