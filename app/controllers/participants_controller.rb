class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @params = {abroad_apartment: '', accessories: '', attitude: '', birthday: '', company: '',
               email: '', frequency: '', hotel: '', important_thing: '', improvements: '', name: '',
               phone: '', source_info: '', summer_holiday: '', surname: '', thirdname: '',
               time_using: '', trip_time: '', drinking_place: '', bolgary: ''}
  end

  def create
    params[:participant].each_key do |k|
      if params[:participant][k].is_a?(Array)
        if params[:participant][k].count > 1
          params[:participant][k] = params[:participant][k].join(' | ')
        else
          params[:participant][k] = params[:participant][k].first
        end
      end
    end
    @params = {abroad_apartment: '', accessories: '', attitude: '', birthday: '', company: '',
               email: '', frequency: '', hotel: '', important_thing: '', improvements: '', name: '',
               phone: '', source_info: '', summer_holiday: '', surname: '', thirdname: '',
               time_using: '', trip_time: '', drinking_place: '', reason: '', bolgary: ''}
    messages = {}
    if params[:participant][:bolgary].blank?
      messages.merge! participant_bolgary: 'Ответьте , пожалуйста, хотите ли вы участвовать в розыгрыше за суперприз?'
    end
    if params[:participant][:accessories].blank?
      messages.merge! participant_accessories: 'Вопрос о сопутствующих товарах остался не отвеченным.'
    end
    if params[:participant][:surname].blank?
      messages.merge! participant_surname: 'Фамилия осталась незаполненой.'
    end
    if params[:participant][:surname].present? && params[:participant][:surname] != params[:participant][:surname].match(/[а-яА-Я]+/).to_s
      messages.merge! participant_surname: 'Фамилия может содержать только буквы от А до Я.'
    end
    if params[:participant][:name].present? && params[:participant][:name] != params[:participant][:name].match(/[а-яА-Я]+/).to_s
      messages.merge! participant_name: 'Имя может содержать только буквы от А до Я.'
    end
    if params[:participant][:thirdname].present? && params[:participant][:thirdname] != params[:participant][:thirdname].match(/[а-яА-Я]+/).to_s
      messages.merge! participant_thirdname: 'Отчетство может содержать только буквы от А до Я.'
    end
    if params[:participant][:phone].present? && params[:participant][:phone] != params[:participant][:phone].match(/7[0-9]{10}/).to_s
      messages.merge! participant_phone: 'Телефон может иметь только следующий формат 7хххххххххх.'
    end
    if params[:participant][:email].present? && params[:participant][:email] != params[:participant][:email].match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/).to_s
      messages.merge! participant_email: 'E-mail имеет неверный формат.'
    end
    if params[:participant][:reason].blank?
      messages.merge! participant_reason: 'Так почему же Вы пьете воду Прима Аква?'
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
    if params[:participant][:thirdname].blank?
      messages.merge! participant_thirdname: 'Отчество осталось незаполненым.'
    end
    if params[:participant][:time_using].blank?
      messages.merge! participant_time_using: 'Вопрос о том как долго вы являетесь нашим клиентом остался не отвеченным.'
    end
    if params[:participant][:drinking_place].blank?
      messages.merge! participant_drinking_place: 'Вопрос о месте употребления воды остался не отвеченным.'
    end
    if params[:participant][:bolgary] && params[:participant][:bolgary] == 'участвую'
      if params[:participant][:hotel].blank?
        messages.merge! participant_hotel: 'Вопрос об отеле остался не отвеченным.'
      end
      if params[:participant][:company].blank?
        messages.merge! participant_company: 'Так с кем же Вы хотели бы поехать в Болгарию.'
      end
      if params[:participant][:trip_time].blank?
        messages.merge! participant_trip_time: 'Ответьте, пожалуйста, когда бы Вы поехали в Болгарию.'
      end
      if params[:participant][:frequency].blank?
        messages.merge! participant_frequency: 'Вопрос о том как часто Вы отдыхаете на море остался не отвеченным.'
      end
      if params[:participant][:summer_holiday].blank?
        messages.merge! participant_summer_holiday: 'Вопрос о планах на отдых остался не отвеченным.'
      end
      if params[:participant][:attitude].blank?
        messages.merge! participant_attitude: 'Ответьте, пожалуйста, как Вы относитесь к Болгарии.'
      end
      if params[:participant][:abroad_apartment].blank?
        messages.merge! participant_abroad_apartment: 'Вопрос о недвижимости за рубежом остался не отвеченным.'
      end
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
