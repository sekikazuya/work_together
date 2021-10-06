class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit( :image, :name, :name_kana, :sector_id, :industry_id, :profile,
                                     :prefecture_id, :city, :building_name, :phone, :business_hours).merge(user_id: current_user.id)
  end

end
