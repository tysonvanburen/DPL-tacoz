class SiteController < ApplicationController

  def index

  end

  def about

  end

  def contact

  end

  def contact_submit
    ContactMailer.contact_request(params).deliver
    redirect_to root_path, notice: 'Thanks for contacting us!'
  end

end
