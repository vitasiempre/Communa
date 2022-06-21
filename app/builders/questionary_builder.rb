class QuestionaryBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper


  def text_area(attribute, options={})
    super(attribute, options.reverse_merge(class: "pluline"))
  end

  def select(object_name, method_name, template_object, options={})
  end
end
