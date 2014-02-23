class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @params = {abroad_apartment: '', accessories: '', attitude: '', birthday: '', company: '',
               email: '', frequency: '', hotel: '', important_thing: '', improvements: '', name: '',
               phone: '', source_info: '', summer_holiday: '', surname: '', thirdname: '',
               time_using: '', trip_time: '', drinking_place: ''}
  end

  def create
    params[:participant].each_key do |k|
      if params[:participant][k].is_a?(Array)
        params[:participant][k] = params[:participant][k].join(' | ')
      end
    end
    @params = {abroad_apartment: '', accessories: '', attitude: '', birthday: '', company: '',
               email: '', frequency: '', hotel: '', important_thing: '', improvements: '', name: '',
               phone: '', source_info: '', summer_holiday: '', surname: '', thirdname: '',
               time_using: '', trip_time: '', drinking_place: ''}
    messages = {}
    if params[:participant][:accessories].blank?
      messages.merge! participant_accessories: 'Вопрос о сопутствующих товарах остался не отвеченным.'
    end
    if params[:participant][:birthday].blank?
      messages.merge! participant_birthday: 'Вопрос о дне рождения остался не отвеченным.'
    end
    if params[:participant][:email].blank?
      messages.merge! participant_email: 'Email остался не заполненым.'
    end
    if params[:participant][:important_thing].blank?
      messages.merge! participant_important_thing: 'Что наиболее важным Вы считаете при выборе воды?'
    end
    if params[:participant][:improvements].blank?
      messages.merge! participant_improvements: 'Так чтобы бы Вы хотели бы у нас улучшить?'
    end
    if params[:participant][:name].blank?
      messages.merge! participant_name: 'Имя осталось незаполненым.'
    end
    if params[:participant][:phone].blank?
      messages.merge! participant_phone: 'Телефон остался незаполненым.'
    end
    if params[:participant][:source_info].blank?
      messages.merge! participant_source_info: 'Так откуда Вы о нас узнали?'
    end
    if params[:participant][:surname].blank?
      messages.merge! participant_surname: 'Фамилия осталась незаполненой.'
    end
    if params[:participant][:thirdname].blank?
      messages.merge! participant_thirdname: 'Отчество осталось незаполненым.'
    end
    if params[:participant][:time_using].blank?
      messages.merge! participant_time_using: 'Вопрос о том как долго вы являетесь нашим клиентом остался не отвеченным.'
    end
    if params[:participant][:drinking_place].blank?
      messages.merge! participant_drinking_place: 'Вопрос о месте употребления воды остался не отвеченным.'
    end
    @messages = messages
    @params.merge!(params[:participant].symbolize_keys)
    @participant = Participant.new(params[:participant])
    if messages.blank?
      @participant.save!
      redirect_to thanks_url(participant: @participant)
    else
      render :new
    end
  end

  def thanks
  end
end
