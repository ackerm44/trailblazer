module ApplicationHelper

  def presentable_date(date)
    date.strftime("%B %d, %Y" )
  end

  def render_nav_bar(current_user)
    if current_user
      render 'layouts/logged_in_header'
    else
      render 'layouts/logged_out_header'
    end
  end

end
