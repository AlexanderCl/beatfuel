module ApplicationHelper

  def cp(path)
    "active" if current_page?(path)
  end

  def flash_class(level)
    case level
      when :notice then "info"
      when :error then "error"
      when :alert then "warning"
    end
  end

end
