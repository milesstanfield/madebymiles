ActiveAdmin.register Portfolio do
  permit_params :title, :teaser, :body, :published, image_ids: [], cover_image_ids: [], role_ids: []

  index do
    column :title
    column :published
    column :link do |portfolio|
      link_to portfolio.slug, portfolio.path
    end
    actions
  end

  show do
    attributes_table do
      row :published
      row :title
      row :teaser
      row :body do |portfolio|
        presented_portfolio = PortfolioPresenter.new portfolio
        presented_portfolio.markdown_body
      end
      row :cover_image do |portfolio|
        if portfolio.cover_images.present?
          "<img style='height:200px;' src='#{portfolio.cover_image_url}'/>".html_safe
        end
      end
      row :link do |portfolio|
        link_to portfolio.slug, portfolio.path
      end
      row :roles do |portfolio|
        portfolio.roles.map(&:title).join(", ")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :published
      f.input :title
      f.input :teaser, as: :string
      f.input :body
      if CoverImage.count > 0
        f.input :cover_images, as: :check_boxes, collection: CoverImage.all
      end
      if Role.count > 0
        f.input :roles, as: :check_boxes, collection: Role.all
      end
    end
    f.actions
  end
end
