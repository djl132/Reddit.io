module ApplicationHelper


# what is the &PROC FOR?

# CREATES A FORM ELEMENT OF THE CLASS FORM-GROUP THAT USES BOOTSTRAP'S
 # HIGHLIGHT EFFECT OF HAS-ERROR CLASS,
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << 'has-error' if errors.any?

    # create a div of form-group class, and displays an error
    content_tag(:div, capture(&block), class: css_class)
  end

end
