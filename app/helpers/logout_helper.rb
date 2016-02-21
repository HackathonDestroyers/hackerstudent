module LogoutHelper
  def logout_link
    if current_hacker
      link_to('Logout', destroy_hacker_session_path, method: :delete, class: 'btn')
    elsif current_student
      link_to('Logout', destroy_student_session_path, method: :delete, class: 'btn')
    else
      ''
    end
  end
end
