class SpaceBookingsController < ApplicationController
	before_action :set_space, except: :show
	before_action :set_space_booking, only: [:general, :save_general]
	before_action :get_space_booking, only: [:dates, :save_dates, :get_terms, :add_term, :destroy_term]

	def show
		@space_booking = SpaceBooking.finished.find_by(token: params[:token])
		raise ActiveRecord::RecordNotFound unless @space_booking
	end

	def general; end

	def save_general
		@space_booking.validation_step = :general
		if @space_booking.update(space_booking_params)
			redirect_to booking_dates_space_path(@space)
		else
			render :general
		end
	end

	def dates
		@app_settings = AppSetting.first_or_create
		@space_booking.validation_step = :general
		unless @space_booking.valid?
			redirect_to booking_general_space_path(@space)
		end
	end

	def save_dates
		@space_booking.validation_step = :dates
		@space_booking.consent = params[:space_booking][:consent]
		if @space_booking.save
			cookies.delete(:booking)
			@space_booking.update(finished: true)
			redirect_to space_booking_path(@space_booking.token), notice: t('space_booking.successfully_booked')
		else
			@app_settings = AppSetting.first_or_create
			render :dates
		end
	end

	def get_terms
		@date = params[:date].to_date
		@taken_intervals = SpaceBookingTerm.taken_intervals(@date)
	end

	def add_term
		@date = params[:date].to_date
		@space_booking_term = @space_booking.space_booking_terms.new(
			date: 		@date,
			time_from: 	params[:time_from],
			time_to: 	params[:time_to]
		)

		unless @space_booking_term.save
			flash.now[:alert] = @space_booking_term.errors.map{ |e, v| v }.to_sentence(last_word_connector: t('last_word_connector'))
		end
	end

	def destroy_term
		@space_booking_term = @space_booking.space_booking_terms.find(params[:term_id])
		@space_booking_term.destroy
	end

	private

	def set_space_booking
		@space_booking = @space.space_bookings.find_by(token: cookies.encrypted[:booking])
		unless @space_booking
			SpaceBooking.find_by(token: cookies.encrypted[:booking])&.destroy
			@space_booking = @space.space_bookings.create
			cookies.encrypted[:booking] = @space_booking.token
		end
	end

	def get_space_booking
		@space_booking = @space.space_bookings.find_by(token: cookies.encrypted[:booking])
		redirect_to booking_general_space_path unless @space_booking
	end

	def space_booking_params
		params.require(:space_booking).permit(:first_name, :last_name, :organisation, :phone, :email, :people_count, :purpose, :consent)
	end

	def set_space
		@space = Space.find(params[:id])
		raise ActiveRecord::RecordNotFound unless @space.bookable
	end
end