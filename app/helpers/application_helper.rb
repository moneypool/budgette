module ApplicationHelper
  CATEGORIES_SVGS = {
    'Food' => 'icons/salad.svg',
    'School' => 'icons/home.svg',
    'Pets' => 'icons/dog.svg',
    'Entertainment' => 'icons/travel.svg',
    'Others' => 'icons/search.svg'
  }

  def goal(name)
    current_user.goals.find_by(category: name)
  end

  def progress_percentage(reached_amount, total_amount)
    progress = (reached_amount / (total_amount || 1)) * 100
    progress.ceil
  end

  def category_svg(name)
    CATEGORIES_SVGS[name]
  end

  def user_over_limit?(reached_amount, total_amount)
    if reached_amount > total_amount
      "uk-text-danger"
    else
      "uk-text-success"
    end
  end
end
