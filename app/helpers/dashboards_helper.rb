module DashboardsHelper

 def customer_data
  CustomerVerification.find_all_by_tab_id(current_user.tab, :order => 'created_at DESC')
  #CoApplicantVerification.find_all_by_tab_id(current_user.tab, :order => 'created_at DESC')
 end

  def customers_list
    CustomerVerification.where("created_at::date = ?", Date.today-1)
  end

  def business_list
    BusinessVerification.where("created_at::date = ?", Date.today-1)
  end

  def co_applicants_list
    CoApplicantVerification.where("created_at::date = ?", Date.today-1)
  end

  def co_app_business_list
    ClientVerification.where("created_at::date = ?", Date.today-1)
  end

  def customer_pending_on_the_tab_today
   Customer.joins(:customer_verification).where('DATE(customer_verifications.created_at) = ? and customers.status = ?', Date.today, 'submitted' )
  end

  def co_applicant_pending_on_the_tab_today
   CoApplicant.joins(:co_applicant_verification).where('DATE(co_applicant_verifications.created_at) = ? and co_applicants.status = ?', Date.today, 'submitted' )
  end

  def business_pending_on_the_tab_today
   Business.joins(:business_verification).where('DATE(business_verifications.created_at) = ? and businesses.status = ?', Date.today, 'submitted' )
  end

  def co_applicant_business_pending_on_the_tab_today
   CoApplicantBusiness.joins(:client_verification).where('DATE(client_verifications.created_at) = ? and co_applicant_businesses.status = ?', Date.today,'submitted' )
  end


  def customer_progress_on_the_tab_today
   Customer.joins(:customer_verification).where('DATE(customer_verifications.created_at) = ? and customers.status = ?', Date.today, 'awaiting_to_get_verified' )
  end

  def co_applicant_progress_on_the_tab_today
   CoApplicant.joins(:co_applicant_verification).where('DATE(co_applicant_verifications.created_at) = ? and co_applicants.status = ?', Date.today, 'awaiting_to_get_verified' )
  end

  def business_progress_on_the_tab_today
   Business.joins(:business_verification).where('DATE(business_verifications.created_at) = ? and businesses.status = ?', Date.today, 'awaiting_to_get_verified' )
  end

  def co_applicant_business_progress_on_the_tab_today
   CoApplicantBusiness.joins(:client_verification).where('DATE(client_verifications.created_at) = ? and co_applicant_businesses.status = ?', Date.today,'awaiting_to_get_verified' )
  end


  def customer_completed_on_the_tab_today
   Customer.joins(:customer_verification).where('DATE(customer_verifications.created_at) = ? and customers.status = ?', Date.today, 'submitted' )
  end

  def co_applicant_completed_on_the_tab_today
   CoApplicant.joins(:co_applicant_verification).where('DATE(co_applicant_verifications.created_at) = ? and co_applicants.status = ?', Date.today, 'verified' )
  end

  def business_completed_on_the_tab_today
   Business.joins(:business_verification).where('DATE(business_verifications.created_at) = ? and businesses.status = ?', Date.today, 'verified' )
  end

  def co_applicant_business_completed_on_the_tab_today
   CoApplicantBusiness.joins(:client_verification).where('DATE(client_verifications.created_at) = ? and co_applicant_businesses.status = ?', Date.today,'verified' )
  end



  def todays_list
    customers_list+business_list+co_applicants_list+co_app_business_list
  end

  def todays_tab_pending_list
    customer_pending_on_the_tab_today+business_pending_on_the_tab_today+co_applicant_pending_on_the_tab_today+co_applicant_business_pending_on_the_tab_today
  end

  def todays_tab_completed_list
    customer_completed_on_the_tab_today+business_completed_on_the_tab_today+co_applicant_completed_on_the_tab_today+co_applicant_business_completed_on_the_tab_today
  end

  def todays_tab_progress_list
    customer_progress_on_the_tab_today+business_progress_on_the_tab_today+co_applicant_progress_on_the_tab_today+co_applicant_business_progress_on_the_tab_today
  end

end
