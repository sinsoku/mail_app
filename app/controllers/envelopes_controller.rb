class EnvelopesController < ApplicationController
  def new
    @envelope = Envelope.new
  end

  def create
    @envelope = Envelope.new envelope_params

    if @envelope.save
      redirect_to new_envelope_path, notice: 'Envelope was successfully created.'
    else
      render :new
    end
  end

  private
  def envelope_params
    params.require(:envelope).permit(:from, :to, :subject, :plain, :html)
  end
end
