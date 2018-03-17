module ApplicationHelper
    def markdown(body)
        Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(body)
    end
end
