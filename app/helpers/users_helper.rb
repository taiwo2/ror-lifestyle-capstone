module UsersHelper
  def record(_user)
    @article.new_record?
  end

  def notrecord(_user)
    !@article.new_record?
  end

  def articledetails(_user)
    @article.author_id(user) == current_user.id(user)
  end
end
